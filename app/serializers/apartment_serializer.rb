class ApartmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :sqm, :bedrooms, :bathrooms, :latitude, :longitude, :image_url

  def image_url
    return unless object.image.attached?

    Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
  end
end
