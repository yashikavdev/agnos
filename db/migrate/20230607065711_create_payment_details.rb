# frozen_string_literal: true

class CreatePaymentDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_details do |t|
      t.decimal :total_due
      t.integer :status, default: 0
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
