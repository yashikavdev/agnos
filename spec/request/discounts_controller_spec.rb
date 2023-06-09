# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DiscountsController, type: :request do
  let(:user) { create(:user) }
  let(:token) { JsonWebToken.jwt_token(user_id: user.id) }
  let(:tax_rate) { create(:tax_rate) }
  let(:item) { create(:item, tax_rate_id: tax_rate.id) }
  let(:discount) { create(:discount, item_id: item.id) }
  let(:params) do
    {
      discount: {
        "percentage": 50.0,
        "status": 'active',
        "item_id": item.id
      }
    }
  end

  let(:invalid_params) do
    {
      discount: {
        "status": 'active'
      }
    }
  end

  describe "GET 'index'" do
    it 'should show all item' do
      get '/discounts', headers: { Authorization: token }
      JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST 'create'" do
    it 'should create item' do
      post('/discounts', headers: { Authorization: token }, params:)
      JSON.parse(response.body)
      expect(response).to have_http_status(:created)
    end

    it 'should create item' do
      post '/discounts', headers: { Authorization: token }, params: invalid_params
      response_body = JSON.parse(response.body)
      expect(response_body['percentage']).to eq(["can't be blank"])
      expect(response_body['item']).to eq(['must exist'])
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
