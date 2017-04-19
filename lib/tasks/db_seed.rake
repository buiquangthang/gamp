namespace :db do
  desc "Seeding data"
  task seeding: :environment do
    bus_route = BusRoute.first

    2.times do
      bus_route.list_places.each do |place|
        Node.create! place_id: place, bus_route: bus_route, arrival_time: "12:00" 
      end
    end
  end
end
