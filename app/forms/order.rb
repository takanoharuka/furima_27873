class Order

  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number

  validates :postal_code, :shipping_area_id, :city, :address, :phone_number, :item_id, :user_id, presence: true
  validates :shipping_area_id, numericality: { other_than: 1 }
   
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: { with: VALID_PHONE_REGEX }
  end

  def save
    Buyer.create(user_id: user_id, item_id: item_id)
    ShipiingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, item_id: item_id, user_id: user_id)
  end
end