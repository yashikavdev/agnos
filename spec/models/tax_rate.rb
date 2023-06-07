# frozen_string_literal: true

# spec/models/tax_rate.rb
require 'rails_helper'

RSpec.describe TaxRate, type: :model do
  describe 'Associatoins' do
    it { should have_one(:item) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:rate) }
  end
end
