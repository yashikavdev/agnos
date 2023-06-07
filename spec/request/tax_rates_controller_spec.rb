require 'rails_helper'

RSpec.describe TaxRatesController, type: :request do
  let(:user) { create(:user) }
  let(:token) { JsonWebToken.jwt_token(user_id: user.id) }
  let(:tax_rate) { create(:tax_rate) }
  let(:params) do
    {
      tax_rate:{
        "name": "test",
        "rate": 20.00
      }
    }
  end

  let(:invalid_params) do
    {
      tax_rate:{
        "name": nil,
        "rate": nil
      }
    }
  end

  describe "GET 'index'" do
    it 'should show all orders' do
      get '/tax_rates', headers: { Authorization: token }
      response_body = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST 'create'" do
    it 'should create order' do
      post '/tax_rates', headers: { Authorization: token }, params: params
      response_body = JSON.parse(response.body)
      expect(response).to have_http_status(:created)
    end


    it 'should create item' do
      post '/tax_rates', headers: { Authorization: token }, params: invalid_params
      response_body = JSON.parse(response.body)
      expect(response_body["name"]).to eq(["can't be blank"])
      expect(response_body["rate"]).to eq(["can't be blank"])
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end