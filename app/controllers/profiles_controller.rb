class ProfilesController < ApplicationController
  before_action :set_current_user

  def index
  end

  def update
    if @user.update(user_params)
      redirect_to profiles_path, notice: 'User was successfully updated.'
    else
      redirect_to profiles_path, error: 'Error updating user.'
    end
  end

  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(*profile_attributes)
  end

  def profile_attributes
    [:user, :name, :email, :company, :market, :team]
  end
end
