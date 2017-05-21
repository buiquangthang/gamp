class TimetablesController < ApplicationController
  before_action :set_bus_route

  def index
    @bus_stations = BusStation.of_ids(@bus_route.list_bus_stations)
    list_nodes = []
    @nodes = @bus_route.time_nodes
    @bus_route.list_time_nodes.each do |ln|
      list_nodes.push(ln.list)
    end
    @matrix_node = Array.new(@bus_route.list_bus_stations.length) {Array.new(list_nodes.length)}
    @bus_route.list_bus_stations.length.times do |i|
      list_nodes.length.times do |j|
        @matrix_node[i][j] = TimeNode.find_by id: list_nodes[j][i]
      end
    end
    @number_of_column = list_nodes.size
  end

  def create
    list_nodes = params[:list_nodes].to_unsafe_hash if params[:list_nodes]
    return unless list_nodes
    list_nodes.each do |nodes|
      list_n = ListTimeNode.create bus_route: @bus_route
      nodes[1].each do |key, value|
        bus_station = BusStation.find_by code: key
        node = TimeNode.create bus_station: bus_station, arrival_time: value,
          bus_route: @bus_route, list_time_node: list_n
        list_n.list.push(node.id)
      end
      node_ids = list_n.list
      nodes_array = TimeNode.of_ids(node_ids)
        .index_by(&:id).values_at(*node_ids)
      (nodes_array.length-1).times do |i|
        Link.create origin: nodes_array[i].id, destination: nodes_array[i+1].id,
          cost: nodes_array[i+1].arrival_time - nodes_array[i].arrival_time
      end
      list_n.save
    end
  end

  def delete_list_node
    ListTimeNode.of_ids(params["list_node_id"].map(&:to_i)).destroy_all
  end

  def update_nodes
    list_nodes = params[:list_nodes].to_unsafe_hash if params[:list_nodes]
    return unless list_nodes
    list_nodes.each do |key, value|
      node = TimeNode.find_by id: key
      if value.empty?
        node.update arrival_time: "00:00"
      else
        node.update arrival_time: value
      end
    end
  end

  private

  def set_bus_route
    @bus_route = BusRoute.find(params[:bus_route_id])
  end
end
