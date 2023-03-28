class Order < ApplicationRecord
    
  has_many :order_details, dependent: :destroy # アソシエーション
  belongs_to :customer # アソシエーション
  
  enum payment_method: { 
    credit_card: 0, 
    transfer: 1, 
  }
  
end
