# frozen_string_literal: true

class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :status, default: 0
      t.decimal :percentage

      t.timestamps
    end
  end
end
