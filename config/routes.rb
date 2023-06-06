Rails.application.routes.draw do
  resources :tax_rates, only: [:index, :create]
  resources :items, only: [:index, :create]
end
