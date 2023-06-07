# frozen_string_literal: true

# app/models/payment_detail.rb
class PaymentDetail < ApplicationRecord
  belongs_to :order
  enum status: [ :pending, :paid ], _default: :pending

  after_create :status_process

  def status_process
    update(status: 1)
  end
end
