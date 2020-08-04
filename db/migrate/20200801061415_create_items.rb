class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,       null: false
      t.integer :user_id
      t.string :price,      null: false
      t.integer :item_status_id,       null: false
      t.integer :shipping_charge_id,  null: false
      t.integer :shipping_area_id,     null: false
      t.integer :shipping_day_id,     null: false
      t.integer :category_id,          null: false  
      t.string  :text
      t.timestamps
    end
  end
end
