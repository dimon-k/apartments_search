class Apartment < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  scope :near_location, ->(city_name){ near(city_name, 20, units: :km) }
end
