GraphTimeNode.create!

10.times do |n|
  BusRoute.create! name: "Tuyen so #{n+1}", bus_type: 0
  BusRoute.create! name: "Tuyen so #{n+1}", bus_type: 1
end
