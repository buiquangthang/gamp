class CreatePlaceRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :place_routes do |t|
      t.references :bus_route, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
