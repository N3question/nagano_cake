class OrderDetail < ApplicationRecord
  
  belongs_to :orders # アソシエーション
  belongs_to :items # アソシエーション
  
end
