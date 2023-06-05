class Item < ApplicationRecord
  validates_presence_of :price, :name
end
