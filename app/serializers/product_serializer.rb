class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :images
  has_one :user
end
