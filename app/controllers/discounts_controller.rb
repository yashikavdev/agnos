# frozen_string_literal: true

# app/controllers/discounts_controller.rb
class DiscountsController < ApplicationController
  def index
    render json: Discount.all
  end

  def create
    discount = Discount.new(discount_params)

    if discount.save
      render json: discount, status: :created
    else
      render json: discount.errors, status: :unprocessable_entity
    end
  end

  private

  def discount_params
    params.require(:discount).permit(:percentage, :status, :item_id)
  end
end
