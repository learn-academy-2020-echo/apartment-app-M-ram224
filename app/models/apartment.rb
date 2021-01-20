class Apartment < ApplicationRecord
    validates :street, :city, :state, :manager, :email, :price, :bedrooms, :bathrooms, :pets, presence: true
    belongs_to :user
end
