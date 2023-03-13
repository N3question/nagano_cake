class Genre < ApplicationRecord

  has_many :items, dependent: :destroy # アソシエーション

end
