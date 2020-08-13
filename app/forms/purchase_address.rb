class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :street_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do  # do~endの全てのカラムに対し、空の選択を保存できないようにする
    validates :city, :street_number
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "can't be blank"}
    validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "can't be blank"}
    validates :region_id, numericality: { other_than: 0, message: "can't be blank" } # 都道府県はid=0が「--」の為
  end

  def save
    # 住所の情報を保存(create)
    Address.create(postal_code: postal_code, region_id: region_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, item_id: item_id, user_id: user_id)
    # 購入品の情報を保存(create)
    Purchase.create(user_id: user_id, item_id: item_id)
  end

end