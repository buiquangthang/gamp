class CreateBusRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :bus_routes do |t|
      t.string :name

      t.timestamps
    end
  end
end
