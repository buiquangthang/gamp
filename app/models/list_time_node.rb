class ListTimeNode < ApplicationRecord
  belongs_to :bus_route
  has_many :time_nodes

  serialize :list, Array
end