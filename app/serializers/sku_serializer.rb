class SkuSerializer < ActiveModel::Serializer
  attributes :id, :size, :qty
  belongs_to :product
end
