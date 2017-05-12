class HomeController < ApplicationController
  before_action :set_bus_line, only: :show_bus_line

  def index
    @bus_lines = BusLine.all
  end

  def show_bus_line
    @bus_route = @bus_line.bus_routes.di.first
    @bus_stations = BusStation.of_ids(@bus_route.list_bus_stations)
      .index_by(&:id).values_at(*@bus_route.list_bus_stations)
    @distances = @bus_route.distances
    @hash = Gmaps4rails.build_markers(@bus_stations) do |bus_station, marker|
      marker.lat bus_station.latitude
      marker.lng bus_station.longitude
      marker.infowindow bus_station.title
      marker.json({id: bus_station.id})
    end
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end

  def show_bus_route
  end

  private

  def set_bus_line
    @bus_line = BusLine.find_by id: params[:bus_line_id].to_i
  end
end
