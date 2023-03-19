class CartItem < ApplicationRecord
  
  has_one_attached :image
  belongs_to :customer # アソシエーション
  belongs_to :item # アソシエーション
  
  # 消費税を加えた商品価格
  def add_tax_price
      (self.price * 1.1).round
  end
  
  # 小計
  def subtotal
    item.add_tax_price * amount
  end
  
  # カート内の商品合計に利用
  def sum_of_price
    item.price * quantity
  end
end
