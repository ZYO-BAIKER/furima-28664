class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def google_oauth2
    authorizatiion
  end

  private

  def authorizatiion
    @user = User.form_omniauth(request.env["omniauth.auth"])
  end
end
