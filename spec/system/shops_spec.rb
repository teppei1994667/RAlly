require 'rails_helper'

  describe 'ショップ認証機能', type: :system do
    describe 'ログインアクセス制限機能' do
      before do
        visit shop_path(1)
      end
      context '未ログインでshopの詳細ページにアクセスした時' do
        it 'ログインページにリダイレクトされる' do
          expect(page).to have_current_path new_shop_session_path
        end
      end
    end

    describe 'ログイン機能' do
      before do
        FactoryBot.create(:shop, shop_name: 'ショップA', email: 'a@example.com')
        shop_b = FactoryBot.create(:shop, shop_name: 'ショップB', email: 'b@example.com')
        visit new_shop_session_path
        fill_in 'shop_email', with: 'a@example.com'
        fill_in 'shop_password', with: 'password'
        click_button 'ログイン'
      end
      context 'ショップAでログインする' do
        it 'ユーザーAのshowページが表示される' do
          expect(page).to have_current_path shop_path(Shop.first)
        end
      end
      context 'ショップAでログインしショップBのshowページにアクセス' do
        before do
          visit shop_path(Shop.second)
        end
        it 'ユーザーAのshowページが表示される' do
          expect(page).to have_current_path shop_path(Shop.first)
        end
      end
    end
  end