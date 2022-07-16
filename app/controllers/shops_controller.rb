class ShopsController < ApplicationController
  before_action :authenticate_shop!
  before_action :person_only_inaccessible

  def show
    @shop = Shop.find(params[:id])
  end

  private
  #他店の詳細画面にはアクセスできない
  def person_only_inaccessible
    @shop = Shop.find(params[:id])
    redirect_to shop_path(current_shop) unless @shop == current_shop
  end
end
