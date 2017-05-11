require 'google_maps_service'

class BusRoutesController < ApplicationController
  before_action :set_bus_route, except: :index
  before_action :list_bus_stations, only: [:add_bus_stations, :destroy_bus_stations]
  before_action :set_global_api
  after_action :set_route, only: [:add_bus_stations, :destroy_bus_stations, :update_bus_stations]
  after_action :delete_nodes, only: :destroy_bus_stations
  after_action :add_nodes, only: :add_bus_stations
  after_action :update_links, only: :update_bus_stations

  def index
    @bus_routes = BusRoute.all
  end

  def show
    @bus_stations = BusStation.of_ids(@bus_route.list_bus_stations)
    @another_bus_stations = BusStation.not_in_routes(@bus_route.list_bus_stations)
    @distances = @bus_route.distances
    @hash = Gmaps4rails.build_markers(@bus_stations) do |bus_station, marker|
      marker.lat bus_station.latitude
      marker.lng bus_station.longitude
      marker.infowindow bus_station.title
    end
  end

  # GET /bus_routes/new
  def new
    @bus_route = BusRoute.new
  end

  def edit
  end

  def create
    @bus_route = BusRoute.new(bus_route_params)

    respond_to do |format|
      if @bus_route.save
        format.html { redirect_to @bus_route, notice: 'Bus route was successfully created.' }
        format.json { render :show, status: :created, location: @bus_route }
      else
        format.html { render :new }
        format.json { render json: @bus_route.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bus_route.update(bus_route_params)
        format.html { redirect_to @bus_route, notice: 'Bus route was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_route }
      else
        format.html { render :edit }
        format.json { render json: @bus_route.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bus_route.destroy
    respond_to do |format|
      format.html { redirect_to bus_routes_url, notice: 'Bus route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_bus_stations
    @bus_route.list_bus_stations += @list_bus_stations
    @bus_route.save
    redirect_to @bus_route
  end

  def destroy_bus_stations
    @bus_route.list_bus_stations -= @list_bus_stations
    @bus_route.save
    redirect_to @bus_route
  end

  def update_bus_stations
    @bus_route.list_bus_stations = params[:list_bus_stations].map(&:to_i)
    @bus_route.save!
    redirect_to @bus_route
  end

  def search_bus_stop
    term = params[:term]
    @bus_stops = BusStation.search_address term, @bus_route.list_bus_stations
    respond_to do |format|
      format.js
    end
  end

  private
    def set_bus_route
      @bus_route = BusRoute.find(params[:id])
    end

    def bus_route_params
      params.require(:bus_route).permit(:name, list_bus_stations: [])
    end

    def list_bus_stations
      @list_bus_stations = params[:list_bus_stations].map(&:to_i)
      return if @list_bus_stations.any?
      flash[:alert] = t "dashboard.whitelist.update.not_choose"
      redirect_to request.referer
    end

    def set_route
      list_bus_stations = @bus_route.list_bus_stations
      Distance.transaction do
        @bus_route.distances.destroy_all
        (list_bus_stations.length - 1).times do |i|
          origin = BusStation.find_by id: list_bus_stations[i]
          origin_latlng = [origin.latitude, origin.longitude]
          destination = BusStation.find_by id: list_bus_stations[i+1]
          destination_latlng = [destination.latitude, destination.longitude]
          route = @gmaps.directions(origin_latlng, destination_latlng,
            mode: 'driving', alternatives: true)
          distance_metter = route[0][:legs][0][:distance][:value]
          Distance.create origin: origin.id, destination: destination.id,
            bus_route: @bus_route, route: route, distance_metter: distance_metter
        end
      end
    end

    def delete_nodes
      @list_bus_stations.each do |bus_station_id|
        nodes = TimeNode.where(bus_route: @bus_route, bus_station_id: bus_station_id)
        nodes.each do |node|
          destination_links = Link.where(destination: node.id)
          origin_links = Link.where(origin: node.id)
          destination_links.each do |des|
            origin_links.each do |ori|
              Link.create origin: des.origin, destination: ori.destination
            end
          end
          destination_links.delete_all
          origin_links.delete_all
          @bus_route.list_time_nodes.each do |l|
            l.list.delete_if {|x| x == node.id}
            l.save
          end
        end
        nodes.delete_all
        @bus_route.list_time_nodes.each do |l|
          l.destroy if l.list.empty?
        end
      end
    end

    def add_nodes
      @bus_route.list_time_nodes.each do |ln|
        previous_list_length = ln.list.length
        @list_bus_stations.each do |bus_station_id|
          node = TimeNode.create bus_route: @bus_route, bus_station_id: bus_station_id,
            list_time_node: ln, arrival_time: "00:00"
          ln.list.push node.id
        end
        ln.save
        new_list_nodes = TimeNode.of_ids(ln.list.drop(previous_list_length-1))
          .index_by(&:id).values_at(*ln.list.drop(previous_list_length-1))

        (new_list_nodes.length-1).times do |i|
          Link.create origin: new_list_nodes[i].id, destination: new_list_nodes[i+1].id,
            cost: new_list_nodes[i+1].arrival_time - new_list_nodes[i].arrival_time 
        end
      end
    end

    def update_links
      list_bus_stations = @bus_route.list_bus_stations
      @bus_route.list_time_nodes.each do |ln|
        previous_list = ln.list
        nodes = TimeNode.of_ids(previous_list)
        new_list = []
        list_bus_stations.each do |lp|
          new_list.push(nodes.find{|n| n.bus_station_id == lp}.id)
        end
        (previous_list.length-1).times do |i|
          Link.find_by(origin: previous_list[i], destination: previous_list[i+1]).destroy
        end

        new_list_nodes = TimeNode.of_ids(new_list)
          .index_by(&:id).values_at(*new_list)
        (new_list.length-1).times do |i|
          Link.create origin: new_list_nodes[i].id, destination: new_list_nodes[i+1].id,
            cost: new_list_nodes[i+1].arrival_time - new_list_nodes[i].arrival_time
        end
        ln.list = new_list
        ln.save
      end
    end
end
