class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @addresses = Address.all
    # @addresses = Address.where(customer_id: current_customer.id)
  end
  
  # 次の画面に持っていくために全てに@がついている。
  # ここでは空のカラムを使って、Viewファイルを使ってコントローラで情報の判別を行う。
  # データの保存はされない。
  def confirm
    @order = Order.new(order_params) 
    @order.payment_method = params[:order][:payment_method]
    
		if params[:order][:address_select] == "0" then
			@order.postal_code = current_customer.postal_code
			@order.address = current_customer.address
			@order.name = current_customer.last_name + current_customer.first_name #修正
			
		elsif params[:order][:address_select] == "1" then
			@sta = params[:order][:address_id].to_i
			@order_address = Address.find(@sta)
			@order.postal_code = @order_address.postal_code
			@order.address = @order_address.address
			@order.name = @order_address.name #修正
			# アドレスのパラメータから呼び出すのでカラム名は統一させる
		elsif params[:order][:address_select] == "2" then
		  # データが読み取られてしまう可能性を加味して以下の記述にしておく。
		  # 判別のデータくらいは読み取られても大丈夫。
		  address = Address.new(address_params)
      address.customer_id = current_customer.id
      address.save
			@order.postal_code = address.postal_code # paramsからではなく、25行目の保存されたデータを使う。
			@order.address = address.address
			@order.name = address.name
		end
		@cart_items = current_customer.cart_items.all
		@total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.price_total }
		@order.customer_id = current_customer.id
  end
  
  def create
    @order = Order.new(order_params) 
    @order.customer_id = current_customer.id
    @order.save
    
    # order_detailに保存
    current_customer.cart_items.each do |cart_item| #カート内商品を1つずつ取り出しループ　　
    @order_detail = OrderDetail.new #初期化宣言
    @order_detail.order_id =  @order.id #order注文idを紐付けておく
      @order_detail.item_id = cart_item.item_id #カート内商品idを注文商品idに代入
      @order_detail.amount = cart_item.amount #カート内商品の個数を注文商品の個数に代入
      @order_detail.price = (cart_item.item.add_tax_price.to_s(:delimited)) #消費税込みに計算して代入
      @order_detail.save #注文商品を保存
    end
    
    current_customer.cart_items.destroy_all # カートの中身を削除
		redirect_to complete_path
  end
  
  def complete
  end
  
  def index
    # @cart_items = current_customer.cart_items
    @orders = current_customer.orders
  end

  def show
    # @order = Order.find(params[:id])
    # @order_details = @order.order_details
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost,
                                  :total_payment,:payment_method, :status)
  end
  
  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end
end
