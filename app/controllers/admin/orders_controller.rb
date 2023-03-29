class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
  end
  
  def index # 各カスタマー用
  end
  
  def update
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost,
                                  :total_payment,:payment_method, :status)
  end
end
