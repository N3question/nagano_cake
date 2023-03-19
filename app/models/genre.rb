class Genre < ApplicationRecord

  has_many :items, dependent: :destroy # アソシエーション
  
  validates :name, presence: true

end
