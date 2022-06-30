class HomesController < ApplicationController
  def top
    #ログイン済みであればshopのshow画面にリダイレクト
    if current_shop
      redirect_to shop_path(current_shop)
    end
  end
end
