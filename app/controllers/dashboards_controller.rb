class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = Challenges::Weekly::Summary.new.call.sorted_users
  end
end
