class ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def create
    item = Item.new(item_params)

    if item.save
      render json: item, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  private

    def item_params
      params.require(:item).permit(:name, :price, :description, :tax_rate_id)
    end
end
