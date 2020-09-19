FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password
    password { password }
    password_confirmation { password }
    first_name { 'うなぎ' }
    last_name { '白焼' }
    first_name_kana { 'ウナギ' }
    last_name_kana { 'シラヤキ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
