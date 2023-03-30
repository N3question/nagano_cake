class Item < ApplicationRecord
  
  has_one_attached :image
  belongs_to :genre # アソシエーション
  has_many :cart_items, dependent: :destroy # アソシエーション
  has_many :orders, through: :order_details # アソシエーション
  
  validates :image, presence: true # いるのか？
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
  
  # 消費税を加えた商品価格
  def add_tax_price
      (price * 1.1).round
  end
end
