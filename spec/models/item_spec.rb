require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#create' do
    before do
      user = create(:user)
      @item = build(:item,user_id: user.id)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end
    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空だと保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'informationが空だと保存できないこと' do
      @item.information = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Information can't be blank")
    end
    it 'priceが空だと保存できない事' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'category_idが空だと保存できない事' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'item_condition_idが空だと保存できない事' do
      @item.item_condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item condition can't be blank")
    end

    it 'shipping_charge_idが空だと保存できない事' do
      @item.shipping_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
    end

    it 'shipping_area_idが空だと保存できない事' do
      @item.shipping_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end

    it 'delivery_date_idが空だと保存できない事' do
      @item.delivery_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
    end

    it 'priceが300円未満では保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end

    it 'priceが9,999,999円を超過すると保存できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end

  end
end
