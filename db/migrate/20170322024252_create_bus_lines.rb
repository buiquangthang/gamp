class CreateBusLines < ActiveRecord::Migration[5.0]
  def change
    create_table :bus_lines do |t|
      t.string :name
      t.time :operating_from
      t.time :operating_to
      t.text :in_charge_unit
      t.integer :ticket_fee
      t.text :description

      t.timestamps
    end
  end
end
