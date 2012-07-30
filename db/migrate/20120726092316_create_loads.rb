class CreateLoads < ActiveRecord::Migration
  def change
    create_table :loads do |t|
      t.column :customer, :string
      t.column :weight, :string
      t.column :equipment, :string
      t.column :location, :string
      t.column :total_price, :string
      t.column :commodity, :string
      t.column :shipment_num, :string
      t.column :bill_to, :string
      t.column :booked, :boolean
      t.column :cargo_value, :string
      t.column :shipper_instructions, :text
      t.column :carrier_instructions, :text
      t.column :carrier, :string
      t.timestamps
    end
  end
end
