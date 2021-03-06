class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      # t.string :image,                   null: false
      t.text :name,                      null: false
      t.text :information,               null: false
      t.integer :price,                  null: false
      t.integer :category_id,            null: false
      t.integer :item_condition_id,      null: false
      t.integer :shipping_charge_id,     null: false
      t.integer :shipping_area_id,       null: false
      t.integer :delivery_date_id,       null: false
      t.integer :user_id,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
