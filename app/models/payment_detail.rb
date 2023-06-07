# frozen_string_literal: true

# app/models/payment_detail.rb
class PaymentDetail < ApplicationRecord
  belongs_to :order
  enum status: %i[pending paid], _default: :pending

  after_create :status_process, :notify_user

  private

  def status_process
    update(status: :paid)
  end

  def notify_user
    NotificationWorker.perform_in(20.minutes, order.user.id)
  end
end
