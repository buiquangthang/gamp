class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.integer :origin
      t.integer :destination

      t.timestamps
    end
  end
end
