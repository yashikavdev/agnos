class AddQuantityToOrderItem < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :quantity, :integer, null: false, default: 1
  end
end
