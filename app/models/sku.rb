class Sku < ApplicationRecord
  belongs_to :product

  validates :size, :qty, :price, presence: :true

  validates :size, uniqueness: { scope: :product }

end
