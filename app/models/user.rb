class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :comments
  has_many :favorites
  has_many :buyer

  NAME_REGX = /\A[ぁ-んァ-ン一-龥]/
  NAME_KANA_REGX = /\A[ァ-ヶー－]+\z/
  PASSWORD_REGX = /\A[a-z0-9]+\z/i
  with_options presence: true do
    
    validates :family_name, format: { with: NAME_REGX , message: "is invalid. Input full-width characters."}
    validates :first_name, format: { with: NAME_REGX , message: "is invalid. Input full-width characters."}
    validates :family_name_kana, format: { with: NAME_KANA_REGX, message: "is invalid. Input full-width katakana characters."}
    validates :first_name_kana, format: { with: NAME_KANA_REGX, message: "is invalid. Input full-width katakana characters."}
    validates :password, format: { with: PASSWORD_REGX, message: "is invalid. Input half-width characters."}
  end
  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day, presence: true
end
