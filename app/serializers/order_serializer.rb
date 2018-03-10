class OrderSerializer < ActiveModel::Serializer
  attributes :id, :picked_up
  has_one :customer
end
