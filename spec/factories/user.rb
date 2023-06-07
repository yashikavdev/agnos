# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    email { 'user@example.com' }
    password { 'Password@123' }
  end
end
