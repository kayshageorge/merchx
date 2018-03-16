class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :images, :price

  belongs_to :user, key: :band

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :band_name, :email
  end

  has_many :skus
  class SkuSerializer < ActiveModel::Serializer
    attributes :id, :size, :qty
  end
end
