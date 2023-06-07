# frozen_string_literal: true

# spec/models/order_spec.rb
require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:order_items).dependent(:destroy) }
    it { should accept_nested_attributes_for(:order_items).allow_destroy(true) }
  end
end
