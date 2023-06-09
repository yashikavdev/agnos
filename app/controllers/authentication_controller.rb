# frozen_string_literal: true

# app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebToken.jwt_token(user_id: user.id)
      render json: { token: }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
