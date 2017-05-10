class BusLine < ApplicationRecord
  after_create :create_bus_routes

  has_many :bus_routes

  private

  def create_bus_routes
    BusRoute.transaction do
      BusRoute.create bus_type: 0, bus_line: self
      BusRoute.create bus_type: 1, bus_line: self
    end
  end
end
