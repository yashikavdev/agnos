# frozen_string_literal: true

# spec/models/item_spec.rb
require 'rails_helper'
RSpec.describe Item, type: :model do
  describe 'Associatoins' do
    it { should belong_to(:tax_rate).optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
  end
end
