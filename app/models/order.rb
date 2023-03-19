class Order < ApplicationRecord
    
  has_many :order_details, dependent: :destroy # アソシエーション
  belongs_to :customer # アソシエーション
  
  enum order_status: {
      "入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済":4
  }

end
