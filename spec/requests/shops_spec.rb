require 'rails_helper'

RSpec.describe 'Shops', type: :request do
  describe 'GET #new_shop_session(ログイン画面表示)' do
    it 'ログイン画面の表示に成功すること' do
      get new_shop_session_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new_shop_registration(新規登録画面)' do
    it '新規登録画面の表示に成功すること' do
      get new_shop_registration_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #shop_session(ログイン機能)' do
    let(:shop) { FactoryBot.create(:shop)}

    it 'ログインに成功すること' do
      sign_in shop
      get shop_path(shop)
      expect(response).to have_http_status(200)
    end
  end

  let(:params) { {shop_name: 'テストショップ', email: Faker::Internet.free_email, password: 'password'} }
  describe 'POST #shop_registration(新規登録)' do
    it '新規登録が成功すること' do
      post shop_registration_path ,params: { shop: params}
      expect(response).to have_http_status(302)
    end
  end
end