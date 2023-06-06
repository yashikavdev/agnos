class User < ApplicationRecord
  require 'securerandom'
  has_secure_password

  validates_presence_of :email, :password

  has_many :orders
  has_many :order_items
end
