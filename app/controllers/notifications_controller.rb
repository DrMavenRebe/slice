# == Schema Information
#
# Table name: notifications
#
#  body       :text
#  created_at :datetime
#  id         :integer          not null, primary key
#  updated_at :datetime
#  user_id    :string
#

class NotificationsController < ApplicationController

  def index
    @count = Notification.count
  end

  def create
    Notification.create( :body => params.to_s )
    render :status => 204
  end
end
