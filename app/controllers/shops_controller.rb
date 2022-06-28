class ShopsController < ApplicationController
  before_action :authenticate_shop!

  def show
    @shop = Shop.find(params[:id])
  end
  
end
