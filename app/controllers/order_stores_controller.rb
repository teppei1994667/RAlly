class OrderStoresController < ApplicationController
  def index
    @shop = current_shop
    @order_stores = OrderStore.all
  end

  def show
  end

  def new
    @shop = current_shop
    @order_store = OrderStore.new
  end

  def create
    order_store = OrderStore.new(order_store_params)
    order_store.shop = current_shop
    if order_store.save
      redirect_to shop_order_stores_path(current_shop)
    else
      @shop = current_shop
      @order_store = OrderStore.new
      render :new
    end
  end

  def edit
  end

  private

  def order_store_params
    params.require(:order_store).permit(:name)
  end
end
