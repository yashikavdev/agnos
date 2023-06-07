password = 'pass123'
1.upto(5) do |i|
  User.create(
    email: "user-#{i}@example.com",
    password: password,
    password_confirmation: password
  )
end

TaxRate.create(rate: 5, name: 'drink')
TaxRate.create(rate: 3, name: 'beverage')
TaxRate.create(rate: 7, name: 'soft-drink')
TaxRate.create(rate: 9, name: 'cooked-food')

Item.create(name: 'Coffee', price: '40', tax_rate_id: 1)
Item.create(name: 'Sandwitch', price: '', tax_rate_id: 4 )
Item.create(name: 'orange-soda', price: '', tax_rate_id: 3)
Item.create(name: 'pizza', price: '', tax_rate_id: 4)
Item.create(name: 'Wine', price: '1500', tax_rate_id: 2)

