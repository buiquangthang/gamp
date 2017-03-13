class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  has_many :from_distances, class_name: Distance.name, foreign_key: :busstop_from,
    dependent: :destroy
  has_many :to_distances, class_name: Distance.name, foreign_key: :busstop_to,
    dependent: :destroy
end
