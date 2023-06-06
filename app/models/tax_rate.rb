class TaxRate < ApplicationRecord
  validates_presence_of :rate, :name
end
