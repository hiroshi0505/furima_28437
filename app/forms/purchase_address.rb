class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :street_number, :building_name, :phone_number, :user_id, :item_id, :token

  POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
  PHONE_NUMBER_REGEX = /\A[0-9]{11}\z/

  with_options presence: true do  # do~endの全てのカラムに対し、空の選択を保存できないようにする
    validates :city, :street_number, :token
    validates :postal_code, format: {with: POSTAL_CODE_REGEX, message: "は「000-0000」のように入力して下さい"}
    validates :phone_number, format: {with: PHONE_NUMBER_REGEX, message: "はハイフン無しの11桁で入力して下さい"}
    validates :region_id, numericality: { other_than: 0, message: "は「--」以外を選択して下さい" } # 都道府県はid=0が「--」の為
  end

  def save
    # 住所の情報を保存(create)
    Address.create(postal_code: postal_code, region_id: region_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, item_id: item_id, user_id: user_id)
    # 購入品の情報を保存(create)
    Purchase.create(user_id: user_id, item_id: item_id)
  end

end