class Product < ApplicationRecord
  belongs_to :user
  has_many :skus, dependent: :destroy

  validates :title, :description, presence: true

end
