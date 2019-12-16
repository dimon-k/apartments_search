# Create fake apartments
9_000.times do
  Apartment.create!(title: FFaker::Lorem.sentence,
                    price: rand(50_000..500_000),
                    sqm: rand(15.00..100.00),
                    bedrooms: rand(0..5),
                    bathrooms: rand(1..3))
end
  