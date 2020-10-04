FactoryBot.define do
  factory :purchase_ship_to_location do
    token { Faker::Lorem.characters(16) }
    postal_code { '123-4567' }
    prefecture_id { 10 }
    city { '鶴ヶ谷町' }
    address { '12-12' }
    building { '前橋第一ビル' }
    phone_num { Faker::Number.number(digits: 11) }
  end
end
