class Distance < ApplicationRecord
  belongs_to :place_from, class_name: Place.name
  belongs_to :place_to, class_name: Place.name
  validates :busstop_from, presence: true
  validates :busstop_to, presence: true
end
