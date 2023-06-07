# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let(:user) { create(:user) }
  let(:token) { JsonWebToken.jwt_token(user_id: user.id) }
  let(:params) do
    {
      user: {
        "email": 'test@example.com',
        "password": 'Password@123'
      }
    }
  end

  let(:invalid_params) do
    {
      user: {
        "email": nil,
        "password": nil
      }
    }
  end

  describe "POST 'create'" do
    it 'should create order' do
      post('/users', headers: { Authorization: token }, params:)
      JSON.parse(response.body)
      expect(response).to have_http_status(:created)
    end

    it 'should create item' do
      post '/users', headers: { Authorization: token }, params: invalid_params
      response_body = JSON.parse(response.body)
      expect(response_body['password']).to eq(["can't be blank"])
      expect(response_body['email']).to eq(["can't be blank"])
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
