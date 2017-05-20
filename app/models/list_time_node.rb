class ListTimeNode < ApplicationRecord
  belongs_to :bus_route
  has_many :time_nodes, dependent: :destroy

  serialize :list, Array

  scope :of_ids, ->(array_id){
    where(id: array_id)
  }
end
