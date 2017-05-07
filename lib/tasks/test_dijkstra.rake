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
    # graph = Graph.new
    # node_ids = Node.pluck(:id)
    # node_ids.map {|id| graph.push id}
    # links = Link.all
    # links.each do |link|
    #   graph.connect_mutually link.origin, link.destination, link.id, link.cost
    # end
    # binding.pry
    # p graph.dijkstra(643, 1448)
    graph = Graph.new
    nodes = [0]
    node_ids = Node.pluck(:id)
    node_ids.map {|id| graph.add_node(nodes[id] = Nod.new("Node #{id}"))}
    links = Link.all
    links.each do |link|
      graph.add_edge(nodes[link.origin], nodes[link.destination], link.cost)
    end
    binding.pry
    shortest_path = Dijkstra.new(graph, nodes[643]).shortest_path_to(nodes[1448])
    pp shortest_path.map(&:to_s)
  end
end
