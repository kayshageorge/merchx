class Sku < ApplicationRecord
  belongs_to :product
  has_many :lineItems, dependent: :destroy

  validates :size, :qty, :price, presence: :true

  validates :size, uniqueness: { scope: :product }

end
