class Admin::HomesController < ApplicationController
  def top
    # @orders = Order.all
    # @total_order = Order.all.sum(:order_id)
  end
  
  private
  
  # def order_params
  #   params.require(:order).permit(:customer_id, :postal_code, :address, :name)
  # end
  
end
