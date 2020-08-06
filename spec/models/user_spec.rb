require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe '#create' do
    # 1. ニックネームとemail、passwordとpassword_confirmation、family_name、first_name、family_name_kana、first_name_kana、birth_dayが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation, family_name, first_name, family_name_kana, first_name_kana, birth_day" do
      user = build(:user)
      expect(user).to be_valid
    end
    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include( "can't be blank") 
    end
    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    # 6. passwordが6文字以上であれば登録できること
    it "is valid with a password that has more than 5 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end
    # 7. passwordが5文字以下であれば登録できないこと
    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end
