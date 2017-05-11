class CreateBusStationRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :bus_station_routes do |t|
      t.references :bus_route, foreign_key: true
      t.references :bus_station, foreign_key: true

      t.timestamps
    end
  end
end
