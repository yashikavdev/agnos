# frozen_string_literal: true

password = 'pass123'
1.upto(5) do |i|
  User.create(
    email: "user-#{i}@example.com",
    password:,
    password_confirmation: password
  )
end

TaxRate.create(rate: 5, name: 'drink')
TaxRate.create(rate: 3, name: 'beverage')
TaxRate.create(rate: 7, name: 'soft-drink')
TaxRate.create(rate: 9, name: 'cooked-food')

Item.create(name: 'Coffee', price: '199', tax_rate_id: 1)
Item.create(name: 'Sandwitch', price: '50', tax_rate_id: 4)
Item.create(name: 'orange-soda', price: '30', tax_rate_id: 3)
Item.create(name: 'pizza', price: '199', tax_rate_id: 4)
Item.create(name: 'Wine', price: '1500', tax_rate_id: 2)

Discount.create(status: 'active', percentage: 20, item_id: 1)
Discount.create(status: 'active', percentage: 100, item_id: 2)
