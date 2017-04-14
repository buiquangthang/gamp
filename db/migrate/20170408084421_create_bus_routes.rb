class CreateBusRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :bus_routes do |t|
      t.string :name
      t.integer :bus_type
      t.text :list_places, limit: 65535

      t.timestamps
    end

    add_index :bus_routes, [:name, :bus_type], unique: true
  end
end
