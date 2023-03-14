class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
    CartItem.destroy_all
    current_user.cart_item.destroy_all
    redirect_to cart_items_path, notice: 'カートが空になりました。' 
  end
  
  def create
    
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:image, :item_id, :name, :customer_id, :amount) 
  end
end
