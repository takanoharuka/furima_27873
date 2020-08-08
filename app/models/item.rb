class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  has_many :comments
  has_many :favorites
  has_many :buyers
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :delivery_date

  validates :image, :name, :information, :price, :category, :item_condition, :shipping_charge, :shipping_area, :delivery_date, presence: true
  validates :category_id, :item_condition_id, :shipping_charge_id, :shipping_area_id, :delivery_date_id, numericality: { other_than: 1 }
  validates :price, numericality: {only_integer: true, greater_than: 300 , less_than: 9999999}

end


