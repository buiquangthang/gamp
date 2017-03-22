class CreateGraphNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :graph_nodes do |t|
      t.text :graph

      t.timestamps
    end
  end
end
