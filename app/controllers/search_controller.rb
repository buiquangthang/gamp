class SearchController < ApplicationController
  def index
  end

  def connect_path coordinate, time, duration_walking
    places = Place.near(coordinate, 1, :units => :km)
    time_max = time
    places.each do |place|
      walking_minute = GoogleDistance coordinate, [place.lat, place.long]
      break if walking_minute > 10
      # For start point
      nodes = Node.where(place_id = place.id AND time_max > arrival_time > time + walking_minute)
      # For end point
      nodes = Node.where(place_id = place.id AND time_max > arrival_time > time)

      nodes.each do |node|
        @graph.connect(node)
      end
    end
  end
end
