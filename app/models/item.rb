class Item < ApplicationRecord
  belongs_to :user
  has_one :item_purchases
  has_one :address
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :region
  belongs_to_active_hash :status

  #全てのカラムに対し、空の選択を保存できないようにする
  with_options presence: true do
    validates :image, :category, :delivery_date, :delivery_fee, :region, :status
    validates :name, length: { maximum: 40 } #商品名は40文字以内
    validates :explanation, length: { maximum: 1000 } #説明文は1000文字以内
    validates :price, inclusion: { in: (300..9999999)} #価格は300~9999999円の間と範囲を指定
  end

  #各ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :delivery_date_id, :delivery_fee_id, :status_id, numericality: { other_than: 1 } 
  validates :region_id, numericality: { other_than: 0 } #都道府県はid=0が「--」の為
end