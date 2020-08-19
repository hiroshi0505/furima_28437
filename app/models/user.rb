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
    validates :password, format: { with: PASSWORD_REGEX, message: "は英字と数字が混在するようにして下さい"}
    validates :first_name, :last_name, format: { with: NAME_REGEX, message: "は全角で入力して下さい"}
    validates :first_furigana, :last_furigana, format: { with: FURIGANA_REGEX, message: "は全角カタカナで入力して下さい"}
  end
end
