require 'rails_helper'

RSpec.describe ItemsController, type: :request do
  let(:user) { create(:user) }
  let(:token) { JsonWebToken.jwt_token(user_id: user.id) }
  let(:tax_rate) { create(:tax_rate) }
  let(:item) { create(:item, tax_rate_id:tax_rate.id) }
  let(:params) do
    {
      item:{
        "name": "test",
        "price": 50.0,
        "description": "some text",
        "tax_rate_id": tax_rate.id
      }
    }
  end

  let(:invalid_params) do
    {
      item:{
        "description": "some text",
      }
    }
  end

  describe "GET 'index'" do
    it 'should show all item' do
      get '/items', headers: { Authorization: token }
      response_body = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST 'create'" do
    it 'should create item' do
      post '/items', headers: { Authorization: token }, params: params
      response_body = JSON.parse(response.body)
      expect(response).to have_http_status(:created)
    end

    it 'should create item' do
      post '/items', headers: { Authorization: token }, params: invalid_params
      response_body = JSON.parse(response.body)
      expect(response_body["price"]).to eq(["can't be blank"])
      expect(response_body["price"]).to eq(["can't be blank"])
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end