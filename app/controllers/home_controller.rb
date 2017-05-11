class HomeController < ApplicationController
  before_action :set_bus_route, only: :show_bus_route

  def index
    @bus_lines = BusLine.all
  end

  def show_bus_line
    @bus_stations = BusStation.of_ids(@bus_route.list_bus_stations)
    @another_bus_stations = BusStation.not_in_routes(@bus_route.list_bus_stations)
    @distances = @bus_route.distances
    @hash = Gmaps4rails.build_markers(@bus_stations) do |bus_station, marker|
      marker.lat bus_station.latitude
      marker.lng bus_station.longitude
      marker.infowindow bus_station.title
      marker.json({id: bus_station.id})
    end
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was successfully created.'}
      format.js
    end
  end

  private

  def set_bus_route
    @bus_route = BusRoute.find(params[:bus_route_id])
  end
end
