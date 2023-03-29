class Public::CustomersController < ApplicationController
  before_action :is_matching_login_customer, only: [:edit, :update] #idが出ないからいらないかも
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

  #退会確認画面用のアクション
  def unsubscribe
     @customer = current_customer
  end
  
  #退会のアクション
  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true) #ここでis_deletedカラムの値をtrueに更新します。
    reset_session #この記述で現在のログイン状況をリセットすることができます。
    flash[:notice] = "退会が完了しました。"
    redirect_to root_path #処理完了後ルートパスへ遷移します。
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,
    :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
  
  def is_matching_login_customer #idが出ないからいらないかも
    @customer = current_customer
    unless @customer.id == current_customer.id
      redirect_to root_path
    end
  end
end
