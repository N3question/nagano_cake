class Order < ApplicationRecord
    
  has_many :order_details, dependent: :destroy # アソシエーション
  belongs_to :customer # アソシエーション
  has_one :item, through: :order_detail

  enum payment_method: { 
    credit_card: 0, 
    transfer: 1, 
  }
  
  enum status: { 
    payment_waiting: 0, 
    payment_confirmation: 1, 
    in_production: 2,
    preparing_delivery: 3,
    delivered: 4,
  }
end
