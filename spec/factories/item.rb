FactoryBot.define do
  factory :item, class: 'Item' do
    name { 'test' }
    price { 20.00 }
    description { "some text" }
  end
end
