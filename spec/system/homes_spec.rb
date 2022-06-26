require 'rails_helper'

describe 'ログイン、新規登録リンク表示', type: :system do
  context 'ホーム画面にアクセスした時' do
    before do
      visit root_path
    end
    it 'ログインページへのリンクが表示される' do
      expect(page).to have_link 'ログイン', href: "/shops/sign_in"
    end
  end
end