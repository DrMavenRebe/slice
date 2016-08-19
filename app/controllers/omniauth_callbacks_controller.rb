class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    identity = Identity.from_omniauth(request.env["omniauth.auth"])
    user = identity.try(:user)
    if user
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      session["devise.user_identity_id"] = identity.id
      redirect_to new_user_registration_path
    end
  end
  alias_method :fitbit_oauth2, :all
end