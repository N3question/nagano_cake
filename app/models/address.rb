class Address < ApplicationRecord
    
  belongs_to :customer # アソシエーション
  # 必ず単数形にすること。
  # アソシエーションがうまくいかないことでエラーが検出することも。

end
