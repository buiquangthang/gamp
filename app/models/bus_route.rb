class BusRoute < ApplicationRecord
  has_many :place_routes
  has_many :places, through: :place_routes
  has_many :distances

  enum bus_type: [:di, :ve]

  serialize :list_places, Array
end
