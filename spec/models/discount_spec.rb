# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe 'Associatoins' do
    it { should belong_to(:item) }
  end

  describe 'validations' do
    it { should validate_presence_of(:percentage) }
  end
end
