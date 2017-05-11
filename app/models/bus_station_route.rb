class BusStationRoute < ApplicationRecord
  belongs_to :bus_route
  belongs_to :bus_station
end
