require 'rails_helper'

describe 'Home画面表示', type: :system do
  before do
    userA = FactoryBot.create(:shop, shop_name: 'ショップA', email: 'a@example.com')
  end

  context 'ログインしていない状態でHome画面にアクセスした時' do
    before do
      visit root_path
    end
    it 'ログインページへのリンクが表示される' do
      expect(page).to have_link 'ログイン', href: "/shops/sign_in"
    end
  end

  context 'ログインしている状態でHome画面にアクセスした時' do
    before do
      visit new_shop_session_path
      fill_in 'shop_email', with: 'a@example.com'
      fill_in 'shop_password', with: 'password'
      click_button 'ログイン'
      visit root_path
    end
    it 'ログインしているshopのshowページにリダイレクトする' do
      expect(page).to have_current_path shop_path(Shop.first)
    end
  end
end