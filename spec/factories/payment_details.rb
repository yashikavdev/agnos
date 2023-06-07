FactoryBot.define do
  factory :payment_detail, class: 'PaymentDetail' do
    total_due { 20.00 }
    status { 1 }
  end
end
