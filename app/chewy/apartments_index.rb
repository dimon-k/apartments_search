class ApartmentsIndex < Chewy::Index
  define_type Apartment.with_attached_image do
    field :title
    field :price, type: 'integer'
    field :sqm, type: 'float'
    field :bedrooms, type: 'integer'
    field :bathrooms, type: 'integer'
    field :image_url, value: -> (apartment) do
      Rails.application.routes.url_helpers.rails_blob_path(apartment.image, only_path: true)
    end
    field :coordinates, type: 'geo_point', value: -> (apartment) do
      { lat: apartment.latitude, lon: apartment.longitude }
    end
  end
end
