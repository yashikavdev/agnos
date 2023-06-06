# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders, :tax_rates, :items, only: %i[index create]
  resources :users, only: [:create]
  post 'auth/login', to: 'authentication#login'
end
