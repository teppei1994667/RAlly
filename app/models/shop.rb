class Shop < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  has_many :order_stores
  validates :shop_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6, maximum: 30}
end
