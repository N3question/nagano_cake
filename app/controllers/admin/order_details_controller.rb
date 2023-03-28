class Admin::OrderDetailsController < ApplicationController
  def show
    # @order_detail.order_id =  @order.id
  end
  
  def update # 途中やめしてるので後でやる
    @order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_orders_path
  end
  
  private
  
  def order_detail_params # 中途半端なまま。後でやる
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status) 
  end

end
