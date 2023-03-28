class OrderDetail < ApplicationRecord
  
  belongs_to :order # アソシエーション
  belongs_to :item # アソシエーション
  
  enum status: { 
    payment_waiting: 1, 
    payment_confirmation: 2, 
    in_production: 3,
    preparing_delivery: 4,
    delivered: 5,
  }
  
end
