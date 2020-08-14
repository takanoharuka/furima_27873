require 'rails_helper'

RSpec.describe Order, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe '#create' do
    before do
      buyer = create(:user)
      seller = create(:user, email: "ddd@gmail.com")
      item = build(:item, user_id: seller.id)
      item.image = fixture_file_upload('public/images/test_image.png')
      item.save
      @order = build(:order, user_id: buyer.id, item_id: item.id)
      sleep(1)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it 'shipping_area_idを選択していないと保存できないこと' do
      @order.shipping_area_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Shipping area must be other than 1")
    end

    it 'cityが空だと保存できないこと' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空だと保存できないこと' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it 'building_nameは空でも保存できること' do
      @order.building_name = nil
      expect(@order).to be_valid
    end

    it 'phone_numberが空だと保存できないこと' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが11桁を超過すると保存できないこと' do
      @order.phone_number = 11
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
