# frozen_string_literal: true

# app/models/tax_rate.rb
class TaxRate < ApplicationRecord
  validates :rate, :name, presence: true

  has_one :item
end
