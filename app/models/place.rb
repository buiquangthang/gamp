class Place < ApplicationRecord
  # geocoded_by :address
  # after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  after_create :push_node
  after_save :update_distance

  # has_many :from_distances, class_name: Distance.name, foreign_key: "busstop_from",
  #   dependent: :destroy
  # has_many :to_distances, class_name: Distance.name, foreign_key: "busstop_to",
  #   dependent: :destroy
  # has_many :busstops_from, through: :from_distances, source: :place_from
  # has_many :busstops_to, through: :to_distances, source: :place_to

  has_many :place_routes
  has_many :bus_routes, through: :place_routes

  scope :not_in_object, ->object do
    where("id NOT IN (?)", object.pluck(:id)) if object.any?
  end

  scope :of_ids, -> place_ids do
    where(id: place_ids)
  end

  scope :not_in_routes, -> place_ids do
    where.not(id: place_ids)
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(12)
    (13..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      place = find_by_id(row["id"]) || new
      place.attributes = row.to_hash.slice(*row.to_hash.keys)
      place.save!
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
    g = GraphNode.first
    g.graph.push id
    g.save!
  end

  def update_distance
    distances = Distance.where("busstop_from = ? or busstop_to = ?", id, id)
    distances.each do |distance|
      distance.update distance_metter: distance.get_distance
    end
  end
end
