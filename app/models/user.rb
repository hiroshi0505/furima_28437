class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :item_purchases

  VALID_EISUZI_REGEX = /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}\z/
  VALID_KANZIKANA_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_FURIGANA_REGEX = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname,:birthday
    validates :password,format: { with: VALID_EISUZI_REGEX, message: "Include both letters and numbers"}
    validates :first_name,:last_name, format: { with: VALID_KANZIKANA_REGEX, message: "Full-width characters"}
    validates :first_furigana,:last_furigana, format: { with: VALID_FURIGANA_REGEX, message: "Full-width katakana characters"}
  end
end
