FactoryBot.define do
  factory :item do
    image                       {File.open("#{Rails.root}/public/images/test_image.png")}
    name                        { "靴" }
    information                 { "色はグリーン" }
    price                       { 5000 }
    category_id                 { 2 }
    item_condition_id           { 2 }
    shipping_charge_id          { 2 }
    shipping_area_id            { 2 }
    delivery_date_id            { 2 }
    # user_id                     { 2 }
  end
end
