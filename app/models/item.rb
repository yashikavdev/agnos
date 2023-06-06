# frozen_string_literal: true

# app/models/item.rb
class Item < ApplicationRecord
  validates_presence_of :price, :name

  belongs_to :tax_rate, optional: true
end
