class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devide_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |userid, password|
      userid == ENV["BASIC_AUTH_ID"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end