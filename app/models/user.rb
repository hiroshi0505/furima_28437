class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  PASSWORD_REGEX = /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}\z/
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  FURIGANA_REGEX = /\A[ァ-ヶー－]+\z/

  # do~endの全てのバリデーションに “presence true” を付ける
  with_options presence: true do
    validates :nickname, :birthday
    validates :password, format: { with: PASSWORD_REGEX, message: "Include both letters and numbers"}
    validates :first_name, :last_name, format: { with: NAME_REGEX, message: "Full-width characters"}
    validates :first_furigana, :last_furigana, format: { with: FURIGANA_REGEX, message: "Full-width katakana characters"}
  end
end
