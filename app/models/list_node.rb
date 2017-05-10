class ListTimeNode < ApplicationRecord
  belongs_to :bus_route
  has_many :nodes

  serialize :list, Array
end
