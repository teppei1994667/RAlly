FactoryBot.define do
  factory :shop do
    shop_name { 'テストショップ' }
    email { Faker::Internet.free_email }
    password { 'password' }
  end
end