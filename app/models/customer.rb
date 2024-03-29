class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items, dependent: :destroy # アソシエーション
  has_many :addresses, dependent: :destroy # アソシエーション
  has_many :cart_items, dependent: :destroy # アソシエーション
  has_many :orders, dependent: :destroy # アソシエーション
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  
  # 以下deviseの元々の機能についているのでいらない。
  # validates :password, presence: true, length: {minimum: 6}
  # validates :encrypted_password　, presence: true
  
  # has_secure_password validations: true
  # validates :mail, presence: true, uniqueness: true
end
