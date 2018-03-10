class Order < ApplicationRecord

  belongs_to :customer
  has_many :lineItems, dependent: :destroy

end
