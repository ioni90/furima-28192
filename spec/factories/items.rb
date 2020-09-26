FactoryBot.define do
  factory :item do
    association :user
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/camera.png'), 'image/png') }
    item_name { Faker::Commerce.department }
    item_detail { Faker::Lorem.sentences }
    price { Faker::Number.between(from:300, to: 9999999) }
    category_id { Faker::Number.between(from:1, to: 10) }
    item_condition_id { Faker::Number.between(from:1, to: 6) }
    delivery_fee_id { Faker::Number.between(from:1, to: 2) }
    prefecture_id { Faker::Number.between(from:1, to: 47) }
    shipping_date_id { Faker::Number.between(from:1, to: 3) }
  end
end
