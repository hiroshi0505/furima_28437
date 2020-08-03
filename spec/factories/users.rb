FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"a12345"}
    password_confirmation {password}
    first_name            {"森泉"}
    last_name             {"拓志"}
    first_furigana        {"モリズミ"}
    last_furigana         {"ヒロシ"}
    birthday              {Faker::Date.birthday}
  end
end