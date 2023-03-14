class CartItem < ApplicationRecord
  
  has_one_attached :image
  belongs_to :item # アソシエーション
  belongs_to :customer # アソシエーション
  
  # 消費税を加えた商品価格
  def add_tax_price
      (self.price * 1.1).round
  end
  
end
