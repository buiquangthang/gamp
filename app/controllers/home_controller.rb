class HomeController < ApplicationController
  before_action :set_bus_route, only: :show_bus_route

  def index
    @bus_routes = BusRoute.all
  end

  def show_bus_route
    @places = Place.of_ids(@bus_route.list_places)
    @another_places = Place.not_in_routes(@bus_route.list_places)
    @distances = @bus_route.distances
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.title
      marker.json({id: place.id})
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
