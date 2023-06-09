# frozen_string_literal: true

# app/models/order.rb
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_one :payment_detail

  accepts_nested_attributes_for :order_items, allow_destroy: true

  after_create :calculate_total_price

  private

  def calculate_total_price
    total_amount, tax_amount, discount_amount = InvoiceGenerator.new(id).perform
    generate_order(total_amount, tax_amount, discount_amount)
  end

  def generate_order(total_amount, tax_amount, discount_amount)
    update(tax_amount:, discount_amount:, total_price: total_amount,
           order_date: DateTime.now)
  end
end
