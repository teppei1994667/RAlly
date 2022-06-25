FactoryBot.define do
  factory :shop do
    shop_name { 'テストショップ' }
    email { 'test1@example.com' }
    password { 'password' }
  end
end