class SearchController < ApplicationController
  def index
    # initial graph
    graph = Graph.new
    nodes = [0]
    node_ids = TimeNode.pluck(:id)
    node_ids.map {|id| graph.add_node(nodes[id] = Nod.new("#{id}"))}
    links = Link.all
    links.each do |link|
      graph.add_edge(nodes[link.origin], nodes[link.destination], link.cost)
    end

    # get start poitn coordinate and end point coordinate
    coor_start = params["start_point"].split(",").map {|f| f.to_f}
    coor_end = params["end_point"].split(",").map {|f| f.to_f}

    # find nearest bus stop inside radius
    start_bus_stations = BusStation.near(coor_start, 0.8, units: :km)
    end_bus_stations = BusStation.near(coor_end, 0.8, units: :km)

    nodes_start = []
    nodes_end = []

    # get node nearest time and bus_station
    start_bus_stations.each do |bus_station|
      temps = TimeNode.where("CAST(arrival_time as time) between '07:00' and '12:00' AND bus_station_id = #{bus_station.id}").pluck(:id)
      nodes_start = nodes_start + temps
    end

    end_bus_stations.each do |bus_station|
      temps = TimeNode.where("CAST(arrival_time as time) between '07:00' and '12:00' AND bus_station_id = #{bus_station.id}").pluck(:id)
      nodes_end = nodes_end + temps
    end

    node_start = Nod.new("TimeNode Start")
    node_end = Nod.new("TimeNode end")
    graph.add_node node_start
    graph.add_node node_end

    # connect start and end point to graph
    nodes_start.each do |node_id|
      graph.add_edge node_start, nodes[node_id], 5.0
    end

    nodes_end.each do |node_id|
      graph.add_edge nodes[node_id], node_end, 5.0
    end

    nodes_result = []
    shortest_path = Dijkstra.new(graph, node_start).shortest_path_to(node_end)
    if shortest_path.class != String
      nodes_result = shortest_path.map(&:to_s)
      nodes_result.shift && nodes_result.pop
      p nodes_result
    else
      p shortest_path
    end

    #calculate result and response to user
    result_node_ids = nodes_result.map(&:to_i)
    result_nodes = TimeNode.where(id: result_node_ids).includes(:bus_route, :bus_station)
      .index_by(&:id).values_at(*result_node_ids)

    binding.pry
    result_distance = []
    @bus_stations = []

    (result_nodes.length - 1).times do |i|
      next if result_nodes[i].bus_station == result_nodes[i+1].bus_station
      result_distance.push Distance.find_by origin: result_nodes[i].bus_station.id,
        destination: result_nodes[i+1].bus_station.id
      @bus_stations.push result_nodes[i].bus_station
    end

    @direction_result = {}
    temp_direction_result = {}

    result_nodes.each_with_index do |node, index|
      if index-1 < 0 || node.bus_route != result_nodes[index - 1].bus_route
        temp_direction_result[:node_start] = node
        temp_direction_result[:bus_station_start] = node.bus_station
      elsif index + 1 == result_nodes.length || node.bus_route != result_nodes[index + 1].bus_route
        temp_direction_result[:node_end] = node
        temp_direction_result[:bus_station_end] = node.bus_station
        @direction_result[node.bus_route] = temp_direction_result
        temp_direction_result = {}
      end
    end

    @bus_stations.push result_nodes.last.bus_station
    #show route
    @distances = result_distance
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
end
