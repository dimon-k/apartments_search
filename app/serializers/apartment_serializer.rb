class ApartmentSerializer < ActiveModel::Serializer
  attributes :title, :price, :sqm, :bedrooms, :bathrooms, :latitude, :longitude, :image_url

  def image_url
    Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
  end
end
