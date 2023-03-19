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
  
  # 合計
 def price_total
   item.add_tax_price * amount
 end
  
end
