class OrderStoresController < ApplicationController
  def index
    @shop = current_shop
  end

  def show
  end

  def new
    @shop = current_shop
    @order_store = OrderStore.new
  end

  def edit
  end
end
