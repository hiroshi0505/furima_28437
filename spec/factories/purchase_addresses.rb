FactoryBot.define do
  factory :purchase_address do
    postal_code       { '123-4567' }
    region_id         { 1 }
    city              { "a" }
    street_number     { "a" }
    building_name     { "a" }
    phone_number      { '01234567890' }

    # association :user
    # association :item

  end
end
