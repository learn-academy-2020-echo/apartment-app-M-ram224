Rails.application.routes.draw do
  # devise/routes for user
  devise_for :users
  # 
  resources :apartments
  # constarints
  get '*path', to: 'home#index', constraints: ->(request){ request.format.html? }

  root to: 'home#index'
end
