class TimetablesController < ApplicationController
  before_action :set_bus_route

  def index
    @places = Place.of_ids(@bus_route.list_places)
    @nodes = @bus_route.nodes.order("arrival_time asc").group_by{|x| x.place_id}
  end

  def update
  end

  private

  def set_bus_route
    @bus_route = BusRoute.find(params[:bus_route_id])
  end
end
