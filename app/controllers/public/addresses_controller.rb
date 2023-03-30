class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @address = Address.new
    # 通常はここでidの定義をするが、アソシエーションで省略可能。
    @addresses = Address.where(customer_id: current_customer.id) # カスタマーごとの配送先を表示
  end

  def edit
    @address = Address.find(params[:id]) 
  end
  
  def create
    @addresses = Address.where(customer_id: current_customer.id)
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to '/addresses'
    else
      render :index
    end
  end
  
  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      redirect_to addresses_path
    else
      render 'edit'
    end
  end
  
  def destroy
    address= Address.find(params[:id])  # データ（レコード）を1件取得
    address.destroy  # データ（レコード）を削除
    redirect_to addresses_path  # 配送先登録・一覧画面へリダイレクト  
  end
  
  private
  # ストロングパラメータ
  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end
end
