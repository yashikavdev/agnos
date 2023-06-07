# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :request do
  let(:user) { create(:user) }
  let(:token) { JsonWebToken.jwt_token(user_id: user.id) }
  let(:order) { create(:order, user_id: user.id) }
  let(:params) do
    {
      order: {
        "user_id": user.id,
        "order_date": Date.today,
        "total_price": 100,
        "tax_amount": 50,
        "discount_amount": 20
      }
    }
  end

  describe "GET 'index'" do
    it 'should show all orders' do
      get '/orders', headers: { Authorization: token }
      JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST 'create'" do
    it 'should create order' do
      post('/orders', headers: { Authorization: token }, params:)
      JSON.parse(response.body)
      expect(response).to have_http_status(:created)
    end
  end
end
