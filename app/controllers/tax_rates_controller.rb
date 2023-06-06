# frozen_string_literal: true

# app/controllers/tax_rates_controller.rb
class TaxRatesController < ApplicationController
  def index
    render json: TaxRate.all
  end

  def create
    tax_rate = TaxRate.new(tax_rate_params)

    if tax_rate.save
      render json: tax_rate, status: :created
    else
      render json: tax_rate.errors, status: :unprocessable_entity
    end
  end

  private

  def tax_rate_params
    params.require(:tax_rate).permit(:name, :rate)
  end
end
