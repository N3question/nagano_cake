class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @items = Item.all
    @cart_item = @items.all
    # #合計金額の初期値は0円
    @total = 0 
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
    CartItem.destroy_all
    current_customer.cart_item.destroy_all
    redirect_to cart_items_path, notice: 'カートが空になりました。' 
  end
  
  def create
  end
end
