# frozen_string_literal: true

# app/services/invoice_generator.rb
class InvoiceGenerator < ApplicationService
  attr_accessor :order_id

  def initialize(order_id)
    @order_id = order_id
  end

  def perform
    price_without_tax = order_items.sum(&:total_amount)
    tax_amount = order_items.sum(&:item_tax_rate)

    discount_amount = apply_discounts(price_without_tax)

    price_with_discount = price_without_tax - discount_amount
    total_amount = add_tax_percentage_amount_from_price(price_with_discount, tax_amount) # calculate tax on items

    [total_amount, tax_amount, discount_amount]
  end

  private

  # returns max active discount applied to all order items
  def apply_discounts(total_price)
    discount_amount = 0
    discounts = order_items.map{|order_item| order_item.item.discounts.active.pluck(:percentage)}
    discount_amount += total_price * discounts.max.first/ 100.to_f
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
