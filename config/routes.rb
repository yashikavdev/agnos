Rails.application.routes.draw do
  resources :orders, :tax_rates, :items, only: [:index, :create]
  resources :users, only: [:create]
  post 'auth/login', to: 'authentication#login'
end
