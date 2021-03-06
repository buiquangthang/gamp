require "pp"

namespace :db do
  desc "Testing"
  task testing: :environment do
    graph = Graph.new
    nodes = [0]
    node_ids = TimeNode.pluck(:id)
    node_ids.map {|id| graph.add_node(nodes[id] = Nod.new("TimeNode #{id}"))}
    links = Link.all
    links.each do |link|
      graph.add_edge(nodes[link.origin], nodes[link.destination], link.cost)
    end
    
    coor_start = [16.071059, 108.185652]
    coor_end = [16.086070, 108.218879]

    start_bus_stations = BusStation.near(coor_start, 0.8, units: :km)
    end_bus_stations = BusStation.near(coor_end, 0.8, units: :km)

    # matrix = GoogleDistanceMatrix::Matrix.new
    # matrix.configure do |config|
    #   config.mode = 'walking'
    #   config.avoid = 'tolls'
    #   config.google_api_key = "AIzaSyCzjkYK_6usldy2pnjk7COj7CM0qf2w388"
    # end

    # lat_lng = GoogleDistanceMatrix::BusStation.new lng: coor_start[1], lat: coor_start[0]
    # dest_address = GoogleDistanceMatrix::BusStation.new lng: coor_end[1], lat: coor_end[0]

    # matrix.origins << lat_lng
    # matrix.destinations << dest_address
    # duration_second = @matrix.route_for(origin: lat_lng, destination: dest_address).duration_in_second

    nodes_start = []
    nodes_end = []

    start_bus_stations.each do |bus_station|
      temps = TimeNode.where("CAST(arrival_time as time) between '01:00' and '03:00' AND bus_station_id = #{bus_station.id}").pluck(:id)
      nodes_start = nodes_start + temps
    end

    end_bus_stations.each do |bus_station|
      temps = TimeNode.where("CAST(arrival_time as time) between '01:00' and '03:00' AND bus_station_id = #{bus_station.id}").pluck(:id)
      nodes_end = nodes_end + temps
    end

    node_start = Nod.new("TimeNode Start")
    node_end = Nod.new("TimeNode end")
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
