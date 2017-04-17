class CreateDistances < ActiveRecord::Migration[5.0]
  def change
    create_table :distances do |t|
      t.integer :origin
      t.integer :destination
      t.float :distance_metter
      t.integer :bus_route_id
      t.text :route

      t.timestamps
    end

    add_index :distances, :origin
    add_index :distances, :destination
    add_index :distances, [:origin, :destination, :bus_route_id], unique: true
  end
end
