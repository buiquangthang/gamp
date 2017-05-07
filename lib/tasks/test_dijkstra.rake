# require_dependency 'edge'
# require_dependency 'graph'
require "pp"
# require_dependency "graph"
# require_dependency "nod"
# require_dependency "edge"
# require_dependency "dijkstra"

namespace :db do
  desc "Testing"
  task testing: :environment do
    graph = Graph.new
    nodes = [0]
    node_ids = Node.pluck(:id)
    node_ids.map {|id| graph.add_node(nodes[id] = Nod.new("Node #{id}"))}
    links = Link.all
    links.each do |link|
      graph.add_edge(nodes[link.origin], nodes[link.destination], link.cost)
    end
    
    coor_start = [16.071059, 108.185652]
    coor_end = [16.086070, 108.218879]

    start_places = Place.near(coor_start, 0.8, units: :km)
    end_places = Place.near(coor_end, 0.8, units: :km)

    # matrix = GoogleDistanceMatrix::Matrix.new
    # matrix.configure do |config|
    #   config.mode = 'walking'
    #   config.avoid = 'tolls'
    #   config.google_api_key = "AIzaSyCzjkYK_6usldy2pnjk7COj7CM0qf2w388"
    # end

    # lat_lng = GoogleDistanceMatrix::Place.new lng: coor_start[1], lat: coor_start[0]
    # dest_address = GoogleDistanceMatrix::Place.new lng: coor_end[1], lat: coor_end[0]

    # matrix.origins << lat_lng
    # matrix.destinations << dest_address
    # duration_second = @matrix.route_for(origin: lat_lng, destination: dest_address).duration_in_second

    nodes_start = []
    nodes_end = []

    start_places.each do |place|
      temps = Node.where("CAST(arrival_time as time) between '01:00' and '03:00' AND place_id = #{place.id}").pluck(:id)
      nodes_start = nodes_start + temps
    end

    end_places.each do |place|
      temps = Node.where("CAST(arrival_time as time) between '01:00' and '03:00' AND place_id = #{place.id}").pluck(:id)
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
      graph.add_edge nodes[node_id], node_end, 1.0
    end

    shortest_path = Dijkstra.new(graph, node_start).shortest_path_to(node_end)
    pp shortest_path.map(&:to_s)
  end
end
