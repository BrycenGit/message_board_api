class ApplicationController < ActionController::API
  include Response

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found)
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message }, 422)
  end

  # acts_as_token_authentication_handler_for User#, fallback: :none
  def restrict_access
    user = User.find_by_authentication_token(params[:access_token])
    head :unauthorized unless user
  end
  
end
