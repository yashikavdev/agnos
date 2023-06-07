# frozen_string_literal: true

# app/services/invoice_generator.rb
class InvoiceGenerator < ApplicationService
  attr_accessor :order_id

  def initialize(order_id)
    @order_id = order_id
  end

  def perform
    total_price = order_items.sum(&:total_amount)
    tax_amount = order_items.sum(&:item_tax_rate)

    discount_amount = apply_discounts(order_items, total_price)

    price_with_tax = add_tax_percentage_amount_from_price(total_price, tax_amount) # calculate tax on items
    total_amount = price_with_tax - discount_amount

    [total_amount, tax_amount, discount_amount]
  end

  private

  def apply_discounts(order_items, total_price)
    discount_amount = 0
    order_items.each do |order_item|
      # If the order quantity is greater than 2, then apply a buy-one-get-one-free discount
      if order_item.quantity > 2
        discount_amount += order_item.item.price
      # If the order quantity is greater than 1, then apply a 30% discount
      elsif order_item.quantity > 1
        discount_amount += total_price * 0.3
      end
    end

    discount_amount
  end

  def add_tax_percentage_amount_from_price(price, tax_rate)
    tax_amount = (price / 100.to_f) * tax_rate
    price + tax_amount
  end

  def order
    Order.find order_id
  end

  def order_items
    order.order_items
  end
end