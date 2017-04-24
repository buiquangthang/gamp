class Link < ApplicationRecord
  after_create :update_cost
  after_update :update_cost
  # after_save :create_edge

  validates_uniqueness_of :origin, scope: [:destination]

  def update_cost
    binding.pry
    node_destination = Node.find_by id: destination
    node_origin = Node.find_by id: origin
    self.cost = node_destination.arrival_time - node_origin.arrival_time
  end

  # def create_edge
  #   g = GraphNode.first
  #   g.graph.connect_mutually origin, destination, id, cost
  #   g.save!
  # end
end
