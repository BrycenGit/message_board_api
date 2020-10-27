class RegistrationsController < ApplicationController
  def create
    user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password])
    render json: user.as_json(only: [:email, :authentication_token]), status: :created
  end
end
