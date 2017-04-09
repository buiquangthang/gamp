GraphNode.create! 

Place.take(13).each_with_index do |place, index|
  Distance.create! busstop_from: place.id , busstop_to: index + 2
end
