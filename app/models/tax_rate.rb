# frozen_string_literal: true

# app/models/tax_rate.rb
class TaxRate < ApplicationRecord
  validates_presence_of :rate, :name

  has_one :item
end
