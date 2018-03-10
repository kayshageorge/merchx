class SkuSerializer < ActiveModel::Serializer
  attributes :id, :size, :price, :qty
  belongs_to :product
end
