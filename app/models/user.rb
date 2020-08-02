class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :item_purchases

  with_options presence: true do
    validates :nickname,:birthday
    validates :password,format: { with: /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}\z/, message: "Include both letters and numbers"}
    validates :first_name,:last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :first_furigana,:last_furigana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
  end
end
