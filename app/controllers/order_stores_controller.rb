class OrderStoresController < ApplicationController
  def index
    @order_stores = current_shop.order_stores
  end

  def show
    @order_store = OrderStore.find(params[:id])
  end

  def new
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
    @order_store = OrderStore.find(params[:id])
  end

  def update
    @order_store = OrderStore.find(params[:id])
    if @order_store.update(order_store_params)
      redirect_to shop_order_stores_path(current_shop)
    else
      @order_store = OrderStore.find(params[:id])
      render :edit
    end
  end

  def destroy
    order_store = OrderStore.find(params[:id])
    order_store.destroy
    redirect_to shop_order_stores_path(current_shop)
  end

  private

  def order_store_params
    params.require(:order_store).permit(:name)
  end
end
