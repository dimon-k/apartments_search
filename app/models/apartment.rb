class Apartment < ApplicationRecord
  has_one_attached :image
  update_index('apartments#apartment') { self }
end
