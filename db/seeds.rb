# Create fake apartments
spanish_cities = [
  'Madrid',
  'Barcelona',
  'Valencia',
  'Seville',
  'Zaragoza',
  'Málaga',
  'Murcia',
  'Palma',
  'Las Palmas de Gran Canaria',
  'Bilbao',
  'Alicante',
  'Córdoba',
  'Valladolid',
  'Vigo',
  'Gijón',
  'L\'Hospitalet de Llobregat',
  'A Coruña',
  'Vitoria-Gasteiz',
  'Granada',
  'Elche',
  'Oviedo',
  'Badalona',
  'Cartagena',
  'Terrassa',
  'Jerez de la Frontera',
  'Sabadell',
  'Santa Cruz de Tenerife',
  'Móstoles',
  'Alcalá de Henares',
  'Pamplona',
  'Fuenlabrada',
  'Almería',
  'Leganés',
  'Donostia-San Sebastián',
  'Burgos',
  'Santander',
  'Castellón de la Plana',
  'Getafe',
  'Albacete',
  'Alcorcón',
  'Logroño',
  'San Cristóbal de La Laguna',
  'Badajoz',
  'Salamanca',
  'Huelva',
  'Lleida',
  'Marbella',
  'Tarragona',
  'León',
  'Cádiz'
]

mapped_spanish_cities = spanish_cities.map do |city|
  [city, Geocoder.search(city).first.coordinates]
end

images_path = 'app/assets/images/apartments/'

3_000.times do
  coord = mapped_spanish_cities.sample(1)[0][1]
  apartment = Apartment.create!(title: FFaker::Lorem.sentence,
                                price: rand(50_000..500_000),
                                sqm: rand(15.00..100.00),
                                bedrooms: rand(0..5),
                                bathrooms: rand(1..3),
                                latitude: coord[0],
                                longitude: coord[1])
  
  file_name = Dir.glob('**', base: images_path).sample(1)[0]
  apartment.image.attach(io: File.open(images_path + file_name), filename: file_name)
end
