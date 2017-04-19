class CreateNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :nodes do |t|
      t.references :bus_route, foreign_key: true
      t.references :place, foreign_key: true
      t.time :arrival_time

      t.timestamps
    end
  end
end
