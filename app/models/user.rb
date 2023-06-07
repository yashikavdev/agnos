# frozen_string_literal: true

# app/models/user.rb
class User < ApplicationRecord
  has_secure_password

  validates :email, :password, presence: true

  has_many :orders
  has_many :order_items
end
