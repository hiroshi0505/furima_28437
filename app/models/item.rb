class Item < ApplicationRecord
  belongs_to :users
  has_one :item_purchases
  has_one :address

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :region
  belongs_to_active_hash :status

  #空の投稿を保存できないようにする
  validates :category, :delivery_date, :delivery_fee, :region, :status, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :delivery_date_id, :delivery_fee_id, :status_id, numericality: { other_than: 1 } 
  validates :region_id, numericality: { other_than: 0 } 
end