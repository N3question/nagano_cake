class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_item = current_customer.cart_items
    @cart_items = current_customer.cart_items.all
  end
  
  ##カート機能はネストしない。
    # buildメゾットとは？
      # current_customerに紐づくcart_itemインスタンスを生成したい場合
        # 通常は1行前に定義する必要があるが、current_customerは不要。
      # ★CustomerモデルとCartItemモデルは、１対多のアソシエーションを設定。
  def create
        @cart_item = current_customer.cart_items.new(cart_item_params)
        if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
            cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
            cart_item.amount += params[:cart_item][:amount].to_i
            cart_item.save
            redirect_to cart_items_path
        elsif 
          @cart_item = current_customer.cart_items.build(cart_item_params)
          @cart_item.save
          redirect_to cart_items_path
        end
    end
  
  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def update
  end
  
  def destroy_all
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount) 
  end
end
