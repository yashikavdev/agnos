# frozen_string_literal: true

class Discount < ApplicationRecord
  belongs_to :item

  validates :percentage, presence: true

  enum status: %i[active not_active], _default: :not_active
end
