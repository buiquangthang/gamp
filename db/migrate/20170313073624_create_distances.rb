class CreateDistances < ActiveRecord::Migration[5.0]
  def change
    create_table :distances do |t|
      t.integer :busstop_from
      t.integer :busstop_to
      t.float :distance_metter

      t.timestamps
    end

    add_index :distances, :busstop_from
    add_index :distances, :busstop_to
    add_index :distances, [:busstop_from, :busstop_to], unique: true
  end
end
