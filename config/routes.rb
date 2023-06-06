Rails.application.routes.draw do
  resources :tax_rates, only: [:index, :create]
  resources :items, only: [:index, :create]
  resources :users, only: [:create]
  post 'auth/login', to: 'authentication#login'
end
