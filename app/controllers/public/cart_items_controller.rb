class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items
  end
  
  def update
  end
  
  def destroy
    item = Item.find(params[:item_id])
    cart_item = current_customer.cart_item.new(item_id: item.id)
    if cart_item.destroy
      redirect_to cart_items_path(item)
    else
      render 'index'
    end
  end
  
  def create
    item = Item.find_by(id: :item_id)
    cart_item = current_customer.cart_items
    if cart_item.save
      redirect_to item_cart_item_path(item)
    else
      render current_customer.cart_items
    end
  end
  
  def destroy_all
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount) 
  end
end
