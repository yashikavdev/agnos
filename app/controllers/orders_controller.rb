# frozen_string_literal: true

# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  before_action :authenticate_request

  def index
    render json: Order.all
  end

  def create
    order = Order.new(order_params)
    order.user_id = @current_user.id

    if order.save
      render json: order, status: :created
    else
      render json: order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(order_items_attributes: %i[id item_id order_id quantity _destroy])
  end
end
