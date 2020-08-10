FactoryBot.define do
  factory :item do
    name             {'hoge'}
    explanation      {'fuga'}
    category_id      {3}
    status_id        {3}
    delivery_fee_id  {3}
    region_id        {3}
    delivery_date_id {3}
    price            {300}
    
    association :user
    # association :address
    # association :item_purchase
  end
end