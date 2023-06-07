# frozen_string_literal: true

# app/models/order_item.rb
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def total_amount
    quantity * item.price
  end

  def item_tax_rate
    item.tax_rate.rate
  end
end
