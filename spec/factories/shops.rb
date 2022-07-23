FactoryBot.define do
  factory :shop do
    shop_name { 'テストショップ' }
    email { Faker::Internet.free_email }
    password { 'password' }

    factory :shop2 do
      password {Faker::Lorem.characters(number: 5)}
    end
    factory :shop3 do
      password {Faker::Lorem.characters(number: 31)}
    end
  end
end