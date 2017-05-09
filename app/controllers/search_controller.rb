class SearchController < ApplicationController
  def index
    graph = Graph.new
    nodes = [0]
    node_ids = Node.pluck(:id)
    node_ids.map {|id| graph.add_node(nodes[id] = Nod.new("#{id}"))}
    links = Link.all
    links.each do |link|
      graph.add_edge(nodes[link.origin], nodes[link.destination], link.cost)
    end

    coor_start = params["start_point"].split(",").map {|f| f.to_f}
    coor_end = params["end_point"].split(",").map {|f| f.to_f}

    start_places = Place.near(coor_start, 0.8, units: :km)
    end_places = Place.near(coor_end, 0.8, units: :km)

    nodes_start = []
    nodes_end = []

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


    nodes_start.each do |node_id|
      graph.add_edge node_start, nodes[node_id], 5.0
    end

    nodes_end.each do |node_id|
      graph.add_edge nodes[node_id], node_end, 5.0
    end
    binding.pry
    shortest_path = Dijkstra.new(graph, node_start).shortest_path_to(node_end)
    if shortest_path.class != String
      nodes_result = shortest_path.map(&:to_s)
      nodes_result.shift && nodes_result.pop
      p nodes_result
    else
      p shortest_path
    end
  end
end
