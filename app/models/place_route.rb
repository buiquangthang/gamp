class PlaceRoute < ApplicationRecord
  belongs_to :bus_route
  belongs_to :place
end
