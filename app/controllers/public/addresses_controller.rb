class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id]) 
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    address = Address.new(address_params)
    # アソシエーションでログインカスタマーのアドレスを検出させる。
    address.customer_id = current_customer.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    address.save!
    # 4. 配送先登録・一覧画面へリダイレクト
    redirect_to '/addresses'
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
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
