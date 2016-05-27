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

class Notification < ActiveRecord::Base
end
