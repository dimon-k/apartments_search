FactoryBot.define do
  factory :apartment, class: Apartment do
    title     { 'Have a great view!' }
    price     { 150000 }
    sqm       { 59.64 }
    bedrooms  { 2 }
    bathrooms { 1 }
  end
end
