class CreateGraphTimeNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :graph_time_nodes do |t|
      t.text :graph

      t.timestamps
    end
  end
end
