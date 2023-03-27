class Order < ApplicationRecord
    
  has_many :order_details, dependent: :destroy # アソシエーション
  belongs_to :customer # アソシエーション
  
  enum payment_method: ["credit_card", "bank_transfer"] #追加
  # enum payment_method: { 
  #   credit_card: 0, 
  #   bank_transfer: 1, 
  # }
  
end
