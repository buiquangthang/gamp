class CreateBusRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :bus_routes do |t|
      t.integer :bus_type
      t.text :list_bus_stations, limit: 65535
      t.references :bus_line

      t.timestamps
    end

    add_index :bus_routes, [:bus_line_id, :bus_type], unique: true
  end
end
