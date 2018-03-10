class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :qty, :total
  has_one :order
  has_one :sku
end
