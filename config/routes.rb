Rails.application.routes.draw do
  # Apartment Routes
  resources :apartments
  
  # devise/user routes
  devise_for :users

  # constraints
  get '*path', to: 'home#index', constraints: ->(request){ request.format.html? }

  # Landing page will be the React component
  root to: 'home#index'
end
