class Item < ApplicationRecord
  
  has_one_attached :image
#   validates is_active, inclusion: [true, false]
  
end
