class SearchController < ApplicationController
  def index
    # initial graph
    graph = Graph.new
    nodes = [0]
    node_ids = Node.pluck(:id)
    node_ids.map {|id| graph.add_node(nodes[id] = Nod.new("#{id}"))}
    links = Link.all
    links.each do |link|
      graph.add_edge(nodes[link.origin], nodes[link.destination], link.cost)
    end

    # get start poitn coordinate and end point coordinate
    coor_start = params["start_point"].split(",").map {|f| f.to_f}
    coor_end = params["end_point"].split(",").map {|f| f.to_f}

    # find nearest bus stop inside radius
    start_places = Place.near(coor_start, 0.8, units: :km)
    end_places = Place.near(coor_end, 0.8, units: :km)

    nodes_start = []
    nodes_end = []

    # get node nearest time and place
    start_places.each do |place|
      temps = Node.where("CAST(arrival_time as time) between '07:00' and '12:00' AND place_id = #{place.id}").pluck(:id)
      nodes_start = nodes_start + temps
    end

    end_places.each do |place|
      temps = Node.where("CAST(arrival_time as time) between '07:00' and '12:00' AND place_id = #{place.id}").pluck(:id)
      nodes_end = nodes_end + temps
    end

    node_start = Nod.new("Node Start")
    node_end = Nod.new("Node end")
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
    result_nodes = Node.where(id: result_node_ids).includes(:bus_route, :place)
      .index_by(&:id).values_at(*result_node_ids)

    result_distance = []
    @places = []

    (result_nodes.length - 1).times do |i|
      next if result_nodes[i].place == result_nodes[i+1].place
      result_distance.push Distance.find_by origin: result_nodes[i].place.id,
        destination: result_nodes[i+1].place.id
      @places.push result_nodes[i].place
    end

    @direction_result = {}
    temp_direction_result = {}

    result_nodes.each_with_index do |node, index|
      if index-1 < 0 || node.bus_route != result_nodes[index - 1].bus_route
        temp_direction_result[:node_start] = node
        temp_direction_result[:place_start] = node.place
      elsif index + 1 == result_nodes.length || node.bus_route != result_nodes[index + 1].bus_route
        temp_direction_result[:node_end] = node
        temp_direction_result[:place_end] = node.place
        @direction_result[node.bus_route] = temp_direction_result
        temp_direction_result = {}
      end
    end

    @places.push result_nodes.last.place
    #show route
    @distances = result_distance
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
end
