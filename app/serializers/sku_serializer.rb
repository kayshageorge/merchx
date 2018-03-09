class SkuSerializer < ActiveModel::Serializer
  attributes :id, :size, :price, :qty
  has_one :product
end
