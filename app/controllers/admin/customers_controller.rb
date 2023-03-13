class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    # @item.is_deleted = false # 最初に「有効」を選択させておく。
  end
  
  def update # @をつけることでデータを引き継ぐことができる。
    @customer = @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customers_path
    else
      #updateを失敗すると編集ページへ
      render 'edit'
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name,:first_name, :last_name_kana,:first_name_kana,
                                     :postal_code, :address, :telephone_number, :email, :is_deleted) 
  end
end
