# require_dependency 'graph'
require_dependency 'edge'

class Distance < ApplicationRecord
  after_create :build_graph
  # after_save :build_graph
  # after_update :update_edge

  # belongs_to :place_from, class_name: Place.name
  # belongs_to :place_to, class_name: Place.name
  validates :busstop_from, presence: true
  validates :busstop_to, presence: true

  def get_distance
    place_from = Place.find_by id: busstop_from
    place_to = Place.find_by id: busstop_to

    @matrix = GoogleDistanceMatrix::Matrix.new
    @matrix.configure do |config|
      config.mode = 'driving'
      config.avoid = 'tolls'
      config.google_api_key = "AIzaSyCzjkYK_6usldy2pnjk7COj7CM0qf2w388"
    end

    lat_lng = GoogleDistanceMatrix::Place.new lng: place_from.longitude, lat: place_from.latitude
    dest_address = GoogleDistanceMatrix::Place.new lng: place_to.longitude, lat: place_to.latitude

    @matrix.origins << lat_lng
    @matrix.destinations << dest_address
    @matrix.route_for(origin: lat_lng, destination: dest_address).distance_in_meters
  end

  private

  def build_graph
    self.distance_metter = get_distance
    self.save
    g = GraphNode.first
    g.graph.connect_mutually busstop_from, busstop_to, id, distance_metter
    g.save!
  end

  def update_edge
    g = GraphNode.first
    return unless g.graph.edges.find {|edge| edge.id = id }
    g.graph.edges.each { |edge|
      if edge.id == id
        edge.src = busstop_from
        edge.dst = busstop_to
        edge.length = distance_metter
      end
    }
    g.save!
  end
end
