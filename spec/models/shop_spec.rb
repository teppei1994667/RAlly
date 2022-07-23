require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe 'Shopモデルのバリデーションテスト' do
    it '有効なshopが登録できること' do
      shop = FactoryBot.build(:shop)
      expect(shop).to be_valid
    end

    it 'shop_nameがnilの場合、無効' do
      shop = FactoryBot.build(:shop, shop_name: nil)
      shop.valid?
      expect(shop.errors[:shop_name]).to include("を入力してください")
    end

    it 'emailがnilの場合、無効' do
      shop = FactoryBot.build(:shop, email: nil)
      shop.valid?
      expect(shop.errors[:email]).to include("を入力してください")
    end

    it 'passwordがnilの場合、無効' do
      shop = FactoryBot.build(:shop, password: nil)
      shop.valid?
      expect(shop.errors[:password]).to include("を入力してください") 
    end 

    it 'passwordが6文字未満の場合、無効' do
      shop = FactoryBot.build(:shop2)
      shop.valid?
      expect(shop.errors[:password]).to include("は6文字以上で入力してください")
    end

    it 'passwordが30文字以上の場合、無効' do
      shop = FactoryBot.build(:shop3)
      shop.valid?
      expect(shop.errors[:password]).to include("は30文字以内で入力してください")
    end
  end
end
