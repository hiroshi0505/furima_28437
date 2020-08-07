FactoryBot.define do
  factory :item do
    name             {Faker::Lorem.sentence}
    explanation      {Faker::Lorem.sentence}
    category_id      {3}
    status_id        {3}
    delivery_fee_id  {3}
    region_id        {3}
    delivery_date_id {3}
    price            {300}
    
    association :user
    # association :address
    # association :item_purchases
  end
end