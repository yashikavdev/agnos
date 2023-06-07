# frozen_string_literal: true

# app/controllers/payment_details_controller.rb
class PaymentDetailsController < ApplicationController
  def create
    payment_detail = PaymentDetail.new(payment_detail_params)

    if payment_detail.save
      render json: payment_detail, status: :created
    else
      render json: payment_detail.errors, status: :unprocessable_entity
    end
  end

  private

  def payment_detail_params
    params.require(:payment_detail).permit(:total_due, :order_id)
  end
end
