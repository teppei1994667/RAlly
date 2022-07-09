class ShopsController < ApplicationController
  #ログインしていないとアクセスできない
  before_action :authenticate_shop!
  #他店の詳細画面にはアクセスできない
  before_action :person_only_inaccessible

  def show
    @shop = Shop.find(params[:id])
  end

  private
  def person_only_inaccessible
    @shop = Shop.find(params[:id])
    redirect_to shop_path(current_shop) unless @shop == current_shop
  end
end
