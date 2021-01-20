require 'rails_helper'

RSpec.describe Apartment, type: :model do
  
  let(:user) { User.create email: 'matt@test.com', password: '123456', password_confirmation: '123456'}
  # apartment = apartment.create(street: "314 Walabee Ln",
    # city: "Chula Vista",
    # state: "CA",
    # manager: "Mr. Franklin",
    # Email: "mfrank@mail.com",
    # price: "800",
    # bedrooms: "1",
    # bathrooms: "1",
    # pets: "No", user_id: user.id)

  it 'should have a valid street' do
    apartment = Apartment.create( 
    city: "Chula Vista",
    state: "CA",
    manager: "Mr. Franklin",
    email: "mfrank@mail.com",
    price: "800",
    bedrooms: "1",
    bathrooms: "1",
    pets: "No", user_id: user.id)
    expect(apartment.errors[:street]).to include "can't be blank"
  end

  it 'should have a valid city' do
    apartment = Apartment.create( 
    street: "314 Walabee Ln",
    state: "CA",
    manager: "Mr. Franklin",
    email: "mfrank@mail.com",
    price: "800",
    bedrooms: "1",
    bathrooms: "1",
    pets: "No", user_id: user.id)
    expect(apartment.errors[:city]).to include "can't be blank"
  end

  it 'should have a valid state' do
    apartment = Apartment.create(
    street: "314 Walabee Ln",
    city: "Chula Vista",
    manager: "Mr. Franklin",
    email: "mfrank@mail.com",
    price: "800",
    bedrooms: "1",
    bathrooms: "1",
    pets: "No", 
    user_id: user.id)
    expect(apartment.errors[:state]).to include "can't be blank"
  end

  it 'should have a valid manager' do
    apartment = Apartment.create(
    street: "314 Walabee Ln",
    city: "Chula Vista",
    state: "CA",
    email: "mfrank@mail.com",
    price: "800",
    bedrooms: "1",
    bathrooms: "1",
    pets: "No", 
    user_id: user.id)
    expect(apartment.errors[:manager]).to include "can't be blank"
  end

  it 'should have a valid email' do
    apartment = Apartment.create(
    street: "314 Walabee Ln",
    city: "Chula Vista",
    state: "CA",
    manager: "Mr. Franklin",
    price: "800",
    bedrooms: "1",
    bathrooms: "1",
    pets: "No", 
    user_id: user.id)
    expect(apartment.errors[:email]).to include "can't be blank"
  end

  it 'should have a valid price' do
    apartment = Apartment.create(
    street: "314 Walabee Ln",
    city: "Chula Vista",
    state: "CA",
    manager: "Mr. Franklin",
    email: "mfrank@mail.com",
    bedrooms: "1",
    bathrooms: "1",
    pets: "No", 
    user_id: user.id)
    expect(apartment.errors[:price]).to include "can't be blank"
  end

  it 'should have a valid bedrooms' do
    apartment = Apartment.create(
    street: "314 Walabee Ln",
    city: "Chula Vista",
    state: "CA",
    manager: "Mr. Franklin",
    email: "mfrank@mail.com",
    price: "800",
    bathrooms: "1",
    pets: "No", 
    user_id: user.id)
    expect(apartment.errors[:bedrooms]).to include "can't be blank"
  end

  it 'should have a valid bathrooms' do
    apartment = Apartment.create(
    street: "314 Walabee Ln",
    city: "Chula Vista",
    state: "CA",
    manager: "Mr. Franklin",
    email: "mfrank@mail.com",
    price: "800",
    bedrooms: "1",
    pets: "No", 
    user_id: user.id)
    expect(apartment.errors[:bathrooms]).to include "can't be blank"
  end

  it 'should have a valid pets' do
    apartment = Apartment.create(
    street: "314 Walabee Ln",
    city: "Chula Vista",
    state: "CA",
    manager: "Mr. Franklin",
    email: "mfrank@mail.com",
    price: "800",
    bedrooms: "1",
    bathrooms: "1",
    user_id: user.id)
    expect(apartment.errors[:pets]).to include "can't be blank"
  end

  it 'should have a valid user' do
    apartment = Apartment.create(
    street: "314 Walabee Ln",
    city: "Chula Vista",
    state: "CA",
    manager: "Mr. Franklin",
    email: "mfrank@mail.com",
    price: "800",
    bedrooms: "1",
    bathrooms: "1",
    pets: "No")
    expect(apartment.errors[:user]).to include "must exist"
  end
end
