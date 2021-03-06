require_dependency 'edge'

class Distance < ApplicationRecord
  belongs_to :bus_route
  serialize :route, Array

  # after_create :build_graph
  # after_destroy :remove_edge
  # after_update :update_edge

  validates :origin, presence: true
  validates :destination, presence: true
  validates_uniqueness_of :origin, scope: [:destination, :bus_route_id]

  def get_distance
    bus_station_from = BusStation.find_by id: origin
    bus_station_to = BusStation.find_by id: destination

    @matrix = GoogleDistanceMatrix::Matrix.new
    @matrix.configure do |config|
      config.mode = 'driving'
      config.avoid = 'tolls'
      config.google_api_key = "AIzaSyCzjkYK_6usldy2pnjk7COj7CM0qf2w388"
    end

    lat_lng = GoogleDistanceMatrix::BusStation.new lng: bus_station_from.longitude, lat: bus_station_from.latitude
    dest_address = GoogleDistanceMatrix::BusStation.new lng: bus_station_to.longitude, lat: bus_station_to.latitude

    @matrix.origins << lat_lng
    @matrix.destinations << dest_address
    @matrix.route_for(origin: lat_lng, destination: dest_address).distance_in_meters
  end

  private

  def build_graph
    g = GraphTimeNode.first
    g.graph.connect_mutually origin, destination, id, distance_metter
    g.save!
  end

  def update_edge
    g = GraphTimeNode.first
    return unless g.graph.edges.find {|edge| edge.id == id }
    g.graph.edges.each { |edge|
      if edge.id == id
        edge.length = distance_metter
      end
    }
    g.save!
  end

  def remove_edge
    g = GraphTimeNode.first
    g.graph.edges.delete_if {|obj| obj.id == id}
    g.save!
  end
end
