# frozen_string_literal: true

class AddTaxRateToItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :tax_rate, index: true
  end
end
