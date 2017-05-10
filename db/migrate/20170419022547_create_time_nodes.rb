class CreateTimeNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :time_nodes do |t|
      t.references :bus_route, foreign_key: true
      t.references :bus_station, foreign_key: true
      t.time :arrival_time
      t.references :list_time_node, foreign_key: true

      t.timestamps
    end
  end
end
