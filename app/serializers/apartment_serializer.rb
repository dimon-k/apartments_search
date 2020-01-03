class ApartmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :sqm, :bedrooms, :bathrooms, :image_url
end
