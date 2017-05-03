require "time"

namespace :db do
  desc "Seeding data"
  task seeding: :environment do
    bus_routes = BusRoute.all

    bus_routes.each do |bus_route|
      t = Time.parse("07:00")
      10.times do |n|
        puts n
        puts t
        t_temp = t
        list_node = ListNode.create bus_route: bus_route
        list_places = bus_route.list_places
        list_places.each do |place_id|
          node = Node.create bus_route: bus_route, place_id: place_id,
            arrival_time: t_temp, list_node: list_node
          list_node.list.push(node.id)
          t_temp = t_temp + 5*60
        end
        list_node.save!
        node_ids = list_node.list
        (node_ids.length-1).times do |i|
          Link.create origin: node_ids[i], destination: node_ids[i+1] 
        end
        t = t + 20*60
      end
    end
  end
end
