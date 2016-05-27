class MarketingController < ApplicationController
  layout 'marketing'

  def index
    if user_signed_in?
      redirect_to dashboards_path
    end
  end
end
