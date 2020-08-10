class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :street_number, :building_name, :phone_number, :item_id

  # do~endの全てのカラムに対し、空の選択を保存できないようにする
  with_options presence: true do
    validates :image, :category, :delivery_date, :delivery_fee, :region, :status
    validates :name, length: { maximum: 40 } # 商品名は40文字以内
    validates :explanation, length: { maximum: 1000 } # 説明文は1000文字以内
    validates :price, inclusion: { in: (300..9999999)} # 価格は300~9999999円の間と範囲を指定
    # 「住所」の郵便番号に関するバリデーション
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  #各ジャンルの選択が「--」の時は保存できないようにする
  validates :region_id, numericality: { other_than: 0, message: "can't be blank" } # 都道府県はid=0が「--」の為

  def save
    # itemの情報を保存し、「item」という変数に入れている
    item = Item.create(name: name, explanation: explanation, price: price, image: image, category: category, delivery_date: delivery_date, delivery_fee: delivery_fee, region: region, status: status )
    
    # 住所の情報を保存
    # Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name,user_id: user.id)
    # 寄付金の情報を保存
    # Donation.create(price: price, user_id: user.id)
  end

end