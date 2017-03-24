class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  after_create :push_node
  after_save :update_distance

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

  def update_distance
    distances = Distance.where("busstop_from = ? or busstop_to = ?", id, id)
    distances.each do |distance|
      distance.update distance_metter: distance.get_distance
    end
  end
end
