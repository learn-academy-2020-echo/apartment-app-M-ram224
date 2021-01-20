# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

apartments = [
  {
    id: 1,
    street: "314 Walabee Ln",
    city: "Chula Vista",
    state: "CA",
    manager: "Mr. Franklin",
    email: "mfrank@mail.com",
    price: "800",
    bedrooms: "1",
    bathrooms: "1",
    pets: "No",
    user_id: 1,
  },
  {
    id: 1,
    street: "4773 Moonton Ave",
    city: "Luxor",
    state: "NV",
    manager: "Mr. Luthor",
    email: "luthor-co@manage.com",
    price: "1200",
    bedrooms: "3",
    bathrooms: "2",
    pets: "Yes",
    user_id: 2,
  },
  {
    id: 3,
    street: "900 Beemer st",
    city: "Bozeman",
    state: "MT",
    manager: "Ms. Caddel",
    email: "caddelindustry@homes.com",
    price: "1500",
    bedrooms: "5",
    bathrooms: "3",
    pets: "Yes",
    user_id: 1,
  },
]

apartments.each do |attributes|
    Apartments.create attributes
    puts "creating apartment #{attributes}"
end