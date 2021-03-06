class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :images, :price

  belongs_to :user, key: :band

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :band_name, :email
  end

  has_many :skus
  class SkuSerializer < ActiveModel::Serializer
    attributes :id, :size, :unisex_label, :ladies_label, :qty


    def unisex_label
      case object.size
      when 'u-xl'
        'xl'
      when 'u-lg'
        'lg'
      when 'u-m'
        'm'
      when 'u-sm'
        'sm'
      when 'u-xs'
        'xs'
      end
    end

    def ladies_label
      case object.size
      when 'l-xs'
        'xs'
      when 'l-sm'
        'sm'
      when 'l-m'
        'm'
      when 'l-lg'
        'lg'
      when 'l-xl'
        'xl'
      end
    end
  end
end
