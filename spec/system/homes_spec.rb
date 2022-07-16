require 'rails_helper'

describe 'Home画面アクセス', type: :system do
  before do
    @user_a = FactoryBot.create(:shop, shop_name: 'ショップA', email: 'a@example.com')
  end

  describe 'Home画面表示' do
    before do
      visit root_path
    end

    context '未ログインでHome画面にアクセスする'
    ' do
      it '正常にアクセスされる' do
        expect(page).to have_current_path root_path
      end

      it 'ログインページへのリンクが表示される' do
        expect(page).to have_link 'ログイン', href: "/shops/sign_in"
      end

      it '新規登録ページへのリンクが表示される' do
        expect(page).to have_link '新規登録', href: "/shops/sign_up"
      end
    end
  end
  

  context 'ログイン済みでHome画面にアクセスした時' do
    before do
      visit new_shop_session_path
      fill_in 'shop_email', with: 'a@example.com'
      fill_in 'shop_password', with: 'password'
      click_button 'ログイン'
      visit root_path
    end

    it 'ログインしているshopのshowページにリダイレクトする' do
      expect(page).to have_current_path shop_path(@user_a)
    end
  end
end