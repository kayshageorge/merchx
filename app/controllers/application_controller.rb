class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::Helpers

  rescue_from StandardError, with: :standard_error

  def not_found
    render(
      json: {
        errors: [{
          type: "NotFound"
        }]
      },
      status: :not_found # :not_found is alias for 404 in rails
    )
  end

  private

  def current_user
    token = request.headers["AUTHORIZATION"]

    begin
      payload = JWT.decode(
        token,
        Rails.application.secrets.secret_key_base
      )&.first

      @user ||= User.find_by(id: payload["id"])
      rescue JWT::DecodeError => error
        nil
    end
  end

    helper_method :current_user

  def authenticate_user!
    head :unauthorized unless current_user.present?
  end

  protected

  def standard_error(error)
    render(
      json: {
        errors: [{
          type: error.class.to_s,
          message: error.message
        }]
      },
      status: :internal_server_error # alias for status code 500
    )
  end
end
