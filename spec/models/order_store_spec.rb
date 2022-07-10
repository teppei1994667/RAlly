require 'rails_helper'

RSpec.describe OrderStore, type: :model do
  describe 'OrderStoreモデルテスト' do
    let(:order_store) { FactoryBot.create(:order_store) }

    it '有効なOrderStoreが登録できること' do
      expect(order_store).to be_valid
    end
    
    it 'nameがnilの場合登録できなこと(無効)' do
      order_store1 = FactoryBot.build(:order_store)
      order_store1.name = nil
      expect(order_store1).to be_invalid
    end

    it 'nameが30文字以上の場合登録できない' do
      order_store1 = FactoryBot.build(:order_store)
      order_store1.name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      expect(order_store1).to be_invalid
    end

    it 'shop_idがnilの場合登録できない(無効)' do
      order_store2 = FactoryBot.build(:order_store)
      order_store2.shop = nil
      expect(order_store2).to be_invalid
    end
  end
end
