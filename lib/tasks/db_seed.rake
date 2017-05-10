require "time"

namespace :db do
  desc "Seeding data"
  task seeding: :environment do
    bus_routes = BusRoute.all

    bus_routes.each do |bus_route|
      t = Time.zone.parse("2000-01-01 07:00").utc
      10.times do |n|
        puts n
        puts t
        t_temp = t
        list_node = ListTimeNode.create bus_route: bus_route
        list_places = bus_route.list_places
        list_places.each do |place_id|
          node = TimeNode.create bus_route: bus_route, place_id: place_id,
            arrival_time: t_temp, list_node: list_node
          list_node.list.push(node.id)
          t_temp = t_temp + 5*60
        end
        list_node.save!
        node_ids = list_node.list
        (node_ids.length-1).times do |i|
          origin_node = TimeNode.find_by id: node_ids[i]
          destination_node = TimeNode.find_by id: node_ids[i+1]
          Link.create origin: node_ids[i], destination: node_ids[i+1], cost: destination_node.arrival_time - origin_node.arrival_time
        end
        t = t + 20*60
      end
    end
  end
end
