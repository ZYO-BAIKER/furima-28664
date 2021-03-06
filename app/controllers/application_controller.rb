class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller? # deviseに関するコントローラーの処理であれば、configure~メソッドを実行

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |userid, password|
      userid == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD'] # 環境変数を読み込む記述
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_date]) # sign_up（新規登録の処理）に対して、nicknameキーのパラメーターを新たに許可
  end
end
