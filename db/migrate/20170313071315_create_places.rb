class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.float :latitude
      t.float :longtitude
      t.string :name
      t.string :address
      t.string :title

      t.timestamps
    end
  end
end
