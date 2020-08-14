class CreateShipiingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipiing_addresses do |t|
      t.string :postal_code,           null: false
      t.integer :shipping_area_id,     null: false
      t.string :city,                  null: false
      t.string :address,               null: false
      t.string :building_name
      t.string :phone_number,          null: false
      t.integer :item_id,              null: false, foreign_key: true
      t.integer :user_id,              null: false, foreign_key: true
      t.timestamps
    end
  end
end

