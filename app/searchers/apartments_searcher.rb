class ApartmentsSearcher
  include ActiveData::Model

  attribute :price_gteq, type: Integer
  attribute :price_lteq, type: Integer
  attribute :sqm_gteq, type: Integer
  attribute :sqm_lteq, type: Integer
  attribute :bedrooms_eq, type: Integer
  attribute :bathrooms_eq, type: Integer
  attribute :location, type: String

  def index
    ApartmentsIndex
  end

  def search
    result = packed_filters.compact.reduce(:merge) || index.all
    result.to_a
  end

  def packed_filters
    [
      price_filter,
      sqm_filter,
      bedrooms_filter,
      bathrooms_filter,
      location_filter
    ]
  end

  def price_filter
    body = {}.tap do |body|
      body.merge!(gte: price_gteq) if price_gteq?
      body.merge!(lte: price_lteq) if price_lteq?
    end
    index.filter(range: {price: body}) if body.present?
  end

  def sqm_filter
    body = {}.tap do |body|
      body.merge!(gte: sqm_gteq) if sqm_gteq?
      body.merge!(lte: sqm_lteq) if sqm_lteq?
    end
    index.filter(range: {sqm: body}) if body.present?
  end

  def bedrooms_filter
    index.filter(term: {bedrooms: bedrooms_eq}) if bedrooms_eq?
  end

  def bathrooms_filter
    index.filter(term: {bathrooms: bathrooms_eq}) if bathrooms_eq?
  end

  def location_filter
    return unless location?

    latitude, longitude = Geocoder.search(location).first.coordinates
    index.filter(geo_distance: { distance:'20km', coordinates: { lat: latitude, lon: longitude } })
  end
end
