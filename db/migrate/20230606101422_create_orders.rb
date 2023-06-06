# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.date :order_date
      t.decimal :total_price
      t.decimal :tax_amount
      t.decimal :discount_amount

      t.timestamps
    end
  end
end
