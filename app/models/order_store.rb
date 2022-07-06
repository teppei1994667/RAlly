class OrderStore < ApplicationRecord
  belongs_to :shop
  validates :name, presence: true, length: { maximum: 30}
  validates :shop_id, presence: true
end
