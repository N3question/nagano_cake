class Item < ApplicationRecord
  
  has_one_attached :image
  # validates is_active, inclusion: [true, false]
  belongs_to :genre # アソシエーション
  
end
