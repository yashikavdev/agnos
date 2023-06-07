# frozen_string_literal: true

# spec/models/order_spec.rb
require 'rails_helper'

# spec/models/payment_detail_spec.rb
RSpec.describe PaymentDetail, type: :model do
  describe 'associations' do
    it { should belong_to(:order) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(pending: 0, paid: 1) }
  end

  # describe 'callbacks' do
  #   let(:user) { create(:user) }
  #   let(:order) { create(:order, user_id: user.id) }
  #   let(:payment_detail) { FactoryBot.create(:payment_detail, order_id: order.id) }

  #   describe 'after_create' do
  #     it 'calls status_process' do
  #       expect(payment_detail).to receive(:status_process)
  #       payment_detail.save
  #     end

  #     it 'calls notify_user' do
  #       expect(payment_detail).to receive(:notify_user)
  #       payment_detail.save
  #     end
  #   end
  # end

  # describe '#status_process' do
  #   let(:user) { create(:user) }
  #   let(:order) { create(:order, user_id: user.id) }
  #   let(:payment_detail) { FactoryBot.create(:payment_detail, order_id: order.id) }

  #   it 'updates the status to paid' do
  #     payment_detail.status_process
  #     expect(payment_detail.status).to eq('paid')
  #   end
  # end

  # describe '#notify_user' do
  #   let(:user) { create(:user) }
  #   let(:order) { create(:order, user_id: user.id) }
  #   let(:payment_detail) { FactoryBot.create(:payment_detail, order_id: order.id) }

  #   it 'calls NotificationWorker with user id' do
  #     expect(NotificationWorker).to receive(:perform_in).with(20.minutes, payment_detail.order.user.id)
  #     payment_detail.notify_user
  #   end
  # end
end
