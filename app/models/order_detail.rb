class OrderDetail < ApplicationRecord
  
  belongs_to :order # アソシエーション
  belongs_to :item # アソシエーション
  
  
end
