class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    # @の使用の有無はViewでインスタンス変数を使用するか否か。
    # エラー内容の際にはいる。バリデーションを設定している時。
    # 今回は下の記述で使用しているのでいる。
    @order_details = @order.order_details.all

    is_updated = true
    if @order_detail.update(order_detail_params)
      # statusが「2(製作中)」=> making_statusを「2(in_production:製作中)」に更新
      if @order_detail.making_status == "in_production"
        @order.update(status: 2)
      end
      
      ## 紐付いている注文商品
      # making_status "すべて「3(production_complete:製作完了)」"=>statusを「3(発送準備中)」に更新
      @order_details.each do |order_detail|
        # making_statusが「3(production_complete:製作完了)」でない場合、is_updatedを「false」
        if order_detail.making_status != "production_complete" 
          is_updated = false
        end
      end
      
      # is_updatedがtrue=> statusが「発送準備中」に更新。
      # 上記のif文がfalseの場合、更新しない。
      @order.update(status: 3) if is_updated
    end
    redirect_to admin_order_path(@order)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost,
                                  :total_payment,:payment_method, :status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end