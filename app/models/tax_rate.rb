class TaxRate < ApplicationRecord
  validates_presence_of :rate, :name

  has_one :item
end
