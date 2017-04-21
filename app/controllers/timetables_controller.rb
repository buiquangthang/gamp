class TimetablesController < ApplicationController
  before_action :set_bus_route

  def index
    @places = Place.of_ids(@bus_route.list_places)
    list_nodes = []
    @nodes = @bus_route.nodes
    @bus_route.list_nodes.each do |ln|
      list_nodes.push(ln.list)
    end
    @matrix_node = Array.new(@bus_route.list_places.length) {Array.new(list_nodes.length)}
    @bus_route.list_places.length.times do |i|
      list_nodes.length.times do |j|
        @matrix_node[i][j] = Node.find_by id: list_nodes[j][i]
      end
    end
    @number_of_column = list_nodes.size
  end

  def create
    list_nodes = params[:list_nodes].to_unsafe_hash if params[:list_nodes]
    return unless list_nodes
    list_nodes.each do |nodes|
      list_n = ListNode.create bus_route: @bus_route
      nodes[1].each do |key, value|
        place = Place.find_by code: key
        node = Node.create place: place, arrival_time: value,
          bus_route: @bus_route, list_node: list_n
        list_n.list.push(node.id)
      end
      node_ids = list_n.list
      (node_ids.length-1).times do |i|
        Link.create origin: node_ids[i], destination: node_ids[i+1] 
      end
      list_n.save
    end
  end

  def update_nodes
    list_nodes = params[:list_nodes].to_unsafe_hash if params[:list_nodes]
    return unless list_nodes
    list_nodes.each do |key, value|
      node = Node.find_by id: key
      node.update arrival_time: value
    end
  end

  private

  def set_bus_route
    @bus_route = BusRoute.find(params[:bus_route_id])
  end
end
