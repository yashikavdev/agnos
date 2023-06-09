# frozen_string_literal: true

FactoryBot.define do
  factory :discount do
    percentage { '9.99' }
    status { 1 }
  end
end
