class Item < ApplicationRecord
  
  has_one_attached :image
  belongs_to :genre # アソシエーション
  
  # 消費税を加えた商品価格
  def add_tax_price
      (self.price * 1.1).round
  end
  
end
