class User < ApplicationRecord
  require 'securerandom'
  has_secure_password
  validates_presence_of :email, :password
end
