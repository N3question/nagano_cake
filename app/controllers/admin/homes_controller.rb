class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all.page(params[:page]).per(10)
    # 以下カスタマーごとのオーダー数のカウント_未完了
    # @total_order = Order.customer.all.sum(:customer_id)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost,
                                  :total_payment,:payment_method, :status)
  end
  
end
