require 'rails_helper'

  describe 'ショップ認証機能', type: :system do
    describe 'ログイン機能' do
      before do
        user_a = FactoryBot.create(:shop, shop_name: 'ショップA', email: 'a@example.com')
      end
      context 'ショップAでログインした時' do
        before do
          visit new_shop_session_path
          fill_in 'shop_email', with: 'a@example.com'
          fill_in 'shop_password', with: 'password'
          click_button 'ログイン'
        end
        
        it 'ユーザーAのshowページが表示される' do
          expect(page).to have_content 'ログアウト'
        end
      end
    end
  end