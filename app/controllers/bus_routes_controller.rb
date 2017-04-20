require 'google_maps_service'

class BusRoutesController < ApplicationController
  before_action :set_bus_route, except: :index
  before_action :list_places, only: [:add_places, :destroy_places]
  before_action :set_global_api
  after_action :set_route, only: [:add_places, :destroy_places, :update_places]
  after_action :delete_nodes, only: :destroy_places

  def index
    @bus_routes = BusRoute.all
  end

  def show
    @places = Place.of_ids(@bus_route.list_places)
    @another_places = Place.not_in_routes(@bus_route.list_places)
    @distances = @bus_route.distances
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.title
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

  def add_places
    @bus_route.list_places += @list_places
    @bus_route.save
    redirect_to @bus_route
  end

  def destroy_places
    @bus_route.list_places -= @list_places
    @bus_route.save
    redirect_to @bus_route
  end

  def update_places
    @bus_route.list_places = params[:list_places].map(&:to_i)
    @bus_route.save!
    redirect_to @bus_route
  end

  private
    def set_bus_route
      @bus_route = BusRoute.find(params[:id])
    end

    def bus_route_params
      params.require(:bus_route).permit(:name, list_places: [])
    end

    def list_places
      @list_places = bus_route_params.values.first.map(&:to_i)
      return if @list_places.any?
      flash[:alert] = t "dashboard.whitelist.update.not_choose"
      redirect_to request.referer
    end

    def set_route
      list_places = @bus_route.list_places
      Distance.transaction do
        @bus_route.distances.destroy_all
        (list_places.length - 1).times do |i|
          origin = Place.find_by id: list_places[i]
          origin_latlng = [origin.latitude, origin.longitude]
          destination = Place.find_by id: list_places[i+1]
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
      @list_places.each do |place_id|
        nodes = Node.where(bus_route: @bus_route, place_id: place_id)
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
          @bus_route.list_nodes.each do |l|
            l.list.delete_if {|x| x == node.id}
            l.save
          end
        end
        nodes.delete_all
      end
    end
end
