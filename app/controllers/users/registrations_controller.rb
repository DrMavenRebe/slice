class Users::RegistrationsController < Devise::RegistrationsController
layout 'registration'

  def create
    if params['secrety_key'] == 'SugarCookie'

      user = User.create!(_user_params)
      identity = Identity.find(_identity_id)
      identity.update_attribute(:user_id, user.id)

      sign_in_and_redirect user

    else
      redirect_to :back, flash: { error: "You need the secret key. Go get it from Dave." }
    end
  end

  def _identity_id
    session["devise.user_identity_id"]
  end

  def _user_params
    ActionController::Parameters.new(params['user']).permit(['name', 'email', 'market', 'team'])
  end
end
