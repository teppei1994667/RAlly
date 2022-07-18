require 'rails_helper'

RSpec.describe "OrderStores", type: :request do

  let(:shop) { FactoryBot.create(:shop) }
  let(:order_store) { FactoryBot.create(:order_store) }
  before do
    sign_in shop
  end

  describe 'GET #index' do
    it '一覧画面の表示に成功すること' do
      get shop_order_stores_path(shop)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it '詳細画面の表示に成功すること' do
      get shop_order_store_path(shop, order_store)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it '新規登録画面の表示に成功すること' do
      get new_shop_order_store_path(shop)
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'GET #edit' do
    it '設定（編集）画面の表示に成功すること' do
      get new_shop_order_store_path(shop, order_store)
      expect(response).to have_http_status(200)
    end
  end

  let(:params1) { { name: 'テストストア' } }
  let(:params2) { { name: '' } }
  let(:params3) { { name: 'テストストア変更' } }
  describe 'POST PUT DELETE' do
    describe 'POST #create' do
      let(:post_order_store1) { post shop_order_stores_path(shop), params: { order_store: params1 } }

      context '正常値を入力' do

        it 'リクエストが成功すること' do 
          post_order_store1
          expect(response).to have_http_status(302)
        end

        it 'order_storeが登録されること' do
          expect do
            post_order_store1
          end.to change(OrderStore, :count).by(1)
        end

        it 'リダイレクトすること' do
          post_order_store1
          expect(response).to redirect_to(shop_order_stores_path(shop))
        end
      end

      context '異常値(空白)を入力' do
        let(:post_order_store2) { post shop_order_stores_path(shop), params: { order_store: params2 } }

        it 'リクエストが成功すること' do
          post_order_store2
          expect(response).to have_http_status(200)
        end

        it 'order_storeが登録されないこと' do
          expect do
            post_order_store2
          end.to_not change(OrderStore, :count)
        end

        #エラーメッセージが実装されればテストを追加
      end
    end

    describe 'PUT #update' do
      context 'パラメータが正常値' do
        let(:put_order_store1) { put shop_order_store_path(shop, order_store), params: { order_store: params3 } }

        it 'リクエストが成功すること' do
          put_order_store1
          expect(response).to have_http_status(302)
        end
        
        it 'order_store名が変更されること' do
          expect do
            put_order_store1
          end.to change{ OrderStore.find(order_store.id).name }.from('MyString').to('テストストア変更')
        end

        it 'リダイレクトされること' do
          put_order_store1
          expect(response).to redirect_to(shop_order_stores_path(shop))
        end
      end

      context 'パラメータが異常値' do
        let(:put_order_store2) { put shop_order_store_path(shop, order_store), params: { order_store: params2 } }
        
        it 'リクエストが成功すること' do
          put_order_store2
          expect(response).to have_http_status(200)
        end

        it 'order_store名が変更されないこと' do
          expect do
            put_order_store2
          end.to_not change(OrderStore.find(order_store.id), :name)
        end

        #エラーメッセージが実装されればテストを追加
      end
    end

    describe 'DELETE #destory' do
      let(:delete_order_store) { delete shop_order_store_path(shop, order_store) }

      it 'リクエストが成功すること' do
        delete_order_store
        expect(response).to have_http_status(302)
      end

      it 'order_storeが削除されること' do
        delete_order_store
        expect(shop.order_stores.reload).not_to include order_store
      end

      it 'リダイレクトされること' do
        delete_order_store
        expect(response).to redirect_to(shop_order_stores_path(shop))
      end
    end
  end
end
