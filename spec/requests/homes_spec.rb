require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe 'GET #top' do
    it 'トップ画面の表示に成功すること' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end