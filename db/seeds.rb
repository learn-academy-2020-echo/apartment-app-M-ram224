user = User.create email: 'm-test@email.com', password: '123456', password_confirmation: '123456'
apartments = [
  {
    street: "314 Walabee Ln",
    city: "Chula Vista",
    state: "CA",
    manager: "Mr. Franklin",
    email: "mfrank@mail.com",
    price: "800",
    bedrooms: "1",
    bathrooms: "1",
    pets: "No",
    user_id: user.id
  },
  {
    street: "4773 Moonton Ave",
    city: "Luxor",
    state: "NV",
    manager: "Mr. Luthor",
    email: "luthor-co@manage.com",
    price: "1200",
    bedrooms: "3",
    bathrooms: "2",
    pets: "Yes",
    user_id: user.id
  },
  {
    street: "900 Beemer st",
    city: "Bozeman",
    state: "MT",
    manager: "Ms. Caddel",
    email: "caddelindustry@homes.com",
    price: "1500",
    bedrooms: "5",
    bathrooms: "3",
    pets: "Yes",
    user_id: user.id
  },
]

apartments.each do |attr|
    Apartment.create attr
    puts "creating apartment: #{attr}"
end