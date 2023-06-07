# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PaymentDetailsController, type: :request do
  let(:user) { create(:user) }
  let(:token) { JsonWebToken.jwt_token(user_id: user.id) }
  let(:order) { create(:order, user_id: user.id) }
  let(:params) do
    {
      payment_detail: {
        "total_due": 10,
        "order_id": order.id
      }
    }
  end

  let(:invalid_params) do
    {
      payment_detail: {
        "total_due": 10
      }
    }
  end

  describe "POST 'create'" do
    it 'should create order' do
      post('/payment_details', headers: { Authorization: token }, params:)
      JSON.parse(response.body)
      expect(response).to have_http_status(:created)
    end

    it 'should create item' do
      post '/payment_details', headers: { Authorization: token }, params: invalid_params
      response_body = JSON.parse(response.body)
      expect(response_body['order']).to eq(['must exist'])
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
