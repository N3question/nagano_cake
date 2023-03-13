class CartItem < ApplicationRecord
  
  belongs_to :customers # アソシエーション
  belongs_to :items # アソシエーション
  
end
