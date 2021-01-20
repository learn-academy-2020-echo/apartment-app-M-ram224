require 'rails_helper'

RSpec.describe "Apartments", type: :request do

    let(:user) { User.create email: 'matt@test.com', password: '123456', password_confirmation: '123456'}

    # -----index------
    it 'gets all the apartments' do
        apartment = Apartment.create( 
        street: "314 Walabee Ln",
        city: "Chula Vista",
        state: "CA",
        manager: "Mr. Franklin",
        email: "mfrank@mail.com",
        price: "800",
        bedrooms: 1,
        bathrooms: 1,
        pets: "No", 
        user_id: user.id)

        get '/apartments'
        apartments = JSON.parse(response.body)

        expect(apartments.length).to eq 1
        expect(response).to have_http_status(200)
    end

    # -----create-----
    it 'creates a new apartment' do
        apartment_params = {
          apartment: {
            street: "314 Walabee Ln",
            city: "Chula Vista",
            state: "CA",
            manager: "Mr. Franklin",
            email: "mfrank@mail.com",
            price: "800",
            bedrooms: 1,
            bathrooms: 1,
            pets: "No", 
            user_id: user.id
          }
        }
        post '/apartments', params: apartment_params
        apartment = Apartment.first
  
        expect(apartment.street).to eq '314 Walabee Ln'
        expect(response).to have_http_status(200)
      end

    # ----update----
      it "edits the apartment" do
        apartment_params = {
          apartment: {
            street: "314 Walabee Ln",
            city: "Chula Vista",
            state: "CA",
            manager: "Mr. Franklin",
            email: "mfrank@mail.com",
            price: "800",
            bedrooms: 1,
            bathrooms: 1,
            pets: "No", 
            user_id: user.id
          }
        }
        post "/apartments", params: apartment_params
        apartment = Apartment.first

        new_apartment_params = {
          apartment: {
            street: "314 Walabee Ln",
            city: "Chula Vista",
            state: "CA",
            manager: "Mr. Franklin",
            email: "mfrank@mail.com",
            price: "1000",
            bedrooms: 2,
            bathrooms: 1,
            pets: "No", 
            user_id: user.id
          }
        }
        patch "/apartments/#{apartment.id}", params: new_apartment_params
        apartment = Apartment.find apartment.id
        
        expect(apartment.price).to eq "1000"
        expect(apartment.bedrooms).to eq 2
        expect(response).to have_http_status(200)
      end

    # -----delete-----
    it 'deletes an apartment' do
        apartment_params = {
          apartment: {
            street: "314 Walabee Ln",
            city: "Chula Vista",
            state: "CA",
            manager: "Mr. Franklin",
            email: "mfrank@mail.com",
            price: "1000",
            bedrooms: 2,
            bathrooms: 1,
            pets: "No", 
            user_id: user.id
          }
        }
        post '/apartments', params: apartment_params
        apartment = Apartment.first
        delete "/apartments/#{apartment.id}"
        apartments = Apartment.all
  
        expect(apartments).to be_empty
        expect(response).to have_http_status(200)
      end
  
      it 'cannot create a new apartment without a street' do
        apartment_params = {
          apartment: {
            city: "Chula Vista",
            state: "CA",
            manager: "Mr. Franklin",
            email: "mfrank@mail.com",
            price: "800",
            bedrooms: 1,
            bathrooms: 1,
            pets: "No", 
            user_id: user.id
          }
        }
        post '/apartments', params: apartment_params
        apartment = JSON.parse(response.body)
  
        expect(apartment['street']).to include "can't be blank"
        expect(response).to have_http_status(422)
      end
  
      it 'cannot create a new apartment without a city' do
        apartment_params = {
          apartment: {
            street: "314 Walabee Ln",
            state: "CA",
            manager: "Mr. Franklin",
            email: "mfrank@mail.com",
            price: "800",
            bedrooms: 1,
            bathrooms: 1,
            pets: "No", 
            user_id: user.id
          }
        }
        post '/apartments', params: apartment_params
        apartment = JSON.parse(response.body)
  
        expect(apartment['city']).to include "can't be blank"
        expect(response).to have_http_status(422)
      end
  
      it 'cannot create a new apartment without a state' do
        apartment_params = {
          apartment: {
            street: "314 Walabee Ln",
            city: "Chula Vista",
            manager: "Mr. Franklin",
            email: "mfrank@mail.com",
            price: "800",
            bedrooms: 1,
            bathrooms: 1,
            pets: "No", 
            user_id: user.id
          }
        }
        post '/apartments', params: apartment_params
        apartment = JSON.parse(response.body)
  
        expect(apartment['state']).to include "can't be blank"
        expect(response).to have_http_status(422)
      end
  
      it 'cannot create a new apartment without a manager' do
        apartment_params = {
          apartment: {
            street: "314 Walabee Ln",
            city: "Chula Vista",
            state: "CA",
            email: "mfrank@mail.com",
            price: "800",
            bedrooms: 1,
            bathrooms: 1,
            pets: "No", 
            user_id: user.id
          }
        }
        post '/apartments', params: apartment_params
        apartment = JSON.parse(response.body)
  
        expect(apartment['manager']).to include "can't be blank"
        expect(response).to have_http_status(422)
      end
  
      it 'cannot create a new apartment without an email' do
        apartment_params = {
          apartment: {
            street: "314 Walabee Ln",
            city: "Chula Vista",
            state: "CA",
            manager: "Mr. Franklin",
            price: "800",
            bedrooms: 1,
            bathrooms: 1,
            pets: "No", 
            user_id: user.id
          }
        }
        post '/apartments', params: apartment_params
        apartment = JSON.parse(response.body)
  
        expect(apartment['email']).to include "can't be blank"
        expect(response).to have_http_status(422)
      end
  
      it 'cannot create a new apartment without a price' do
        apartment_params = {
          apartment: {
            street: "314 Walabee Ln",
            city: "Chula Vista",
            state: "CA",
            manager: "Mr. Franklin",
            email: "mfrank@mail.com",
            bedrooms: 1,
            bathrooms: 1,
            pets: "No", 
            user_id: user.id
          }
        }
        post '/apartments', params: apartment_params
        apartment = JSON.parse(response.body)
  
        expect(apartment['price']).to include "can't be blank"
        expect(response).to have_http_status(422)
  
      end
      it 'cannot create a new apartment without bedrooms' do
        apartment_params = {
          apartment: {
            street: "314 Walabee Ln",
            city: "Chula Vista",
            state: "CA",
            manager: "Mr. Franklin",
            email: "mfrank@mail.com",
            price: "800",
            bathrooms: 1,
            pets: "No", 
            user_id: user.id
          }
        }
        post '/apartments', params: apartment_params
        apartment = JSON.parse(response.body)
  
        expect(apartment['bedrooms']).to include "can't be blank"
        expect(response).to have_http_status(422)
  
      end
  
      it 'cannot create a new apartment without bathrooms' do
        apartment_params = {
          apartment: {
            street: "314 Walabee Ln",
            city: "Chula Vista",
            state: "CA",
            manager: "Mr. Franklin",
            email: "mfrank@mail.com",
            price: "800",
            bedrooms: 1,
            pets: "No", 
            user_id: user.id
          }
        }
        post '/apartments', params: apartment_params
        apartment = JSON.parse(response.body)
  
        expect(apartment['bathrooms']).to include "can't be blank"
        expect(response).to have_http_status(422)
      end
  
      it 'cannot create a new apartment without pets' do
        apartment_params = {
          apartment: {
            street: "314 Walabee Ln",
            city: "Chula Vista",
            state: "CA",
            manager: "Mr. Franklin",
            email: "mfrank@mail.com",
            price: "800",
            bedrooms: 1,
            bathrooms: 1,
            user_id: user.id
          }
        }
        post '/apartments', params: apartment_params
        apartment = JSON.parse(response.body)
  
        expect(apartment['pets']).to include "can't be blank"
        expect(response).to have_http_status(422)
      end
end
