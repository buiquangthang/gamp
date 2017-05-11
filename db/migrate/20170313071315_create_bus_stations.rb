class CreateBusStations < ActiveRecord::Migration[5.0]
  def change
    create_table :bus_stations do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :address
      t.string :title
      t.string :code

      t.timestamps
    end
  end
end
