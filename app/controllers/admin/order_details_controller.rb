class Admin::OrderDetailsController < ApplicationController
  
  def update # 途中やめしてるので後でやる
    @order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_orders_path
  end
  
  def customer_show
  end
  
  private
  
  def order_detail_params # 中途半端なまま。後でやる
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status) 
  end

end
