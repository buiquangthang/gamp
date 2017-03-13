class AddColumnToUSer < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gmaps, :boolean
  end
end
