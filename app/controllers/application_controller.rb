class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::Helpers

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

  private

  def authenticate_user!
    head :unauthorized unless current_user.present?
  end
end
