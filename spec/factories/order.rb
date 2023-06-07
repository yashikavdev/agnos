# frozen_string_literal: true

FactoryBot.define do
  factory :order, class: 'Order' do
    order_date { Date.today }
    total_price { 100 }
    tax_amount { 50 }
    discount_amount { 20 }
  end
end
