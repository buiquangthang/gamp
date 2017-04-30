class CreateListNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :list_nodes do |t|
      t.references :bus_route, foreign_key: true
      t.text :list

      t.timestamps
    end
  end
end
