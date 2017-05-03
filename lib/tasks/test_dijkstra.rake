require_dependency 'edge'
require_dependency 'graph'

namespace :db do
  desc "Testing"
  task testing: :environment do
    graph = Graph.new
    node_ids = Node.pluck(:id)
    node_ids.map {|id| graph.push id}
    links = Link.all
    links.each do |link|
      graph.connect_mutually link.origin, link.destination, link.id, link.cost
    end
    binding.pry
    p graph.dijkstra(643, 1448)
  end
end
