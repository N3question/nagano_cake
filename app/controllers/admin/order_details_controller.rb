class Admin::OrderDetailsController < ApplicationController
  def update # 途中やめしてるので後でやる
    @order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_orders_path
  end
  
  private
  
  def order_params # 中途半端なまま。後でやる
    params.require(:order).permit() 
  end

end
