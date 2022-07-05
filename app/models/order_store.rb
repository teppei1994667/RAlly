class OrderStore < ApplicationRecord
  belongs_to :shop

  validates :name, presence: true, length: { maximum: 30}
end
