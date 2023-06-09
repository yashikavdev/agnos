# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders, :tax_rates, :items, :discounts, only: %i[index create]
  resources :users, :payment_details, only: [:create]
  post 'auth/login', to: 'authentication#login'
end
