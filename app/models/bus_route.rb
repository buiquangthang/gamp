class BusRoute < ApplicationRecord
  has_many :bus_station_routes
  has_many :bus_stations, through: :bus_station_routes
  has_many :distances
  has_many :time_nodes
  has_many :list_time_nodes
  belongs_to :bus_line
  enum bus_type: [:di, :ve]

  serialize :list_bus_stations, Array
end
