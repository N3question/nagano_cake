class Public::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = current_customer
  end
  
  def update # @をつけることでデータを引き継ぐことができる。
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to my_page_path
    else
      #updateを失敗すると編集ページへ
      render 'edit'
    end
  end

  def unsubscribe
  end
  
  def withdraw
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,
    :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
