# frozen_string_literal: true

# spec/models/order_item_spec.rb
require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe 'Associatoins' do
    it { should belong_to(:order) }
    it { should belong_to(:item) }
  end
end
