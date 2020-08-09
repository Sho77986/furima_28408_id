class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :item_id,        null:false,  foreign_key: true                
      t.string  :postal_code_id,    null: false
      t.integer :shipping_area_id,  null: false
      t.string  :city_id,          null: false
      t.string  :address_id,        null: false
      t.string  :building
      t.string  :call_number,       null: false
      t.timestamps
    end
  end
end
