class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  after_create :push_node

  has_many :from_distances, class_name: Distance.name, foreign_key: "busstop_from",
    dependent: :destroy
  has_many :to_distances, class_name: Distance.name, foreign_key: "busstop_to",
    dependent: :destroy
  has_many :busstops_from, through: :from_distances, source: :place_from
  has_many :busstops_to, through: :to_distances, source: :place_to

  private

  def push_node
    g = GraphNode.first
    g.graph.push id
    g.save!
  end
end
