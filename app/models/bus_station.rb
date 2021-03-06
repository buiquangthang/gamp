class BusStation < ApplicationRecord
  geocoded_by :address
  # after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  # after_create :push_node
  # after_update :update_distance
  # after_save :update_distance

  # has_many :from_distances, class_name: Distance.name, foreign_key: "busstop_from",
  #   dependent: :destroy
  # has_many :to_distances, class_name: Distance.name, foreign_key: "busstop_to",
  #   dependent: :destroy
  # has_many :busstops_from, through: :from_distances, source: :bus_station_from
  # has_many :busstops_to, through: :to_distances, source: :bus_station_to

  has_many :bus_station_routes
  has_many :bus_routes, through: :bus_station_routes
  has_many :nodes

  scope :not_in_object, ->object do
    where("id NOT IN (?)", object.pluck(:id)) if object.any?
  end

  scope :of_ids, -> bus_station_ids do
    where(id: bus_station_ids)
  end

  scope :not_in_routes, -> bus_station_ids do
    where.not(id: bus_station_ids)
  end

  scope :search_address, -> term, bus_station_ids do
    where("LOWER(address) LIKE :address", address: "%#{term}%")
      .where.not(id: bus_station_ids)
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(12)
    (13..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      bus_station = find_by_id(row["id"]) || new
      bus_station.attributes = row.to_hash.slice(*row.to_hash.keys)
      bus_station.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
    when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  private

  def push_node
    g = GraphTimeNode.first
    g.graph.push id
    g.save!
  end

  def update_distance
    GoogleMapsService.configure do |config|
      config.key = 'AIzaSyDBEPeNCZHAyqAYysF2-ykAp8jfd47bxIw'
      config.retry_timeout = 20
      config.queries_per_second = 10
    end

    gmaps = GoogleMapsService::Client.new

    distances = Distance.where("origin = ? or destination = ?", id, id)
    distances.each do |distance|
      origin = BusStation.find_by id: distance.origin
      origin_latlng = [origin.latitude, origin.longitude]
      destination = BusStation.find_by id: distance.destination
      destination_latlng = [destination.latitude, destination.longitude]
      route = gmaps.directions(origin_latlng, destination_latlng,
        mode: 'driving', alternatives: true)
      distance_metter = route[0][:legs][0][:distance][:value]
      distance.update distance_metter: distance_metter, route: route
    end
  end
end
