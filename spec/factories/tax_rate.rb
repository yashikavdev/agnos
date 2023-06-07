# frozen_string_literal: true

FactoryBot.define do
  factory :tax_rate, class: 'TaxRate' do
    name { 'test' }
    rate { 100 }
  end
end
