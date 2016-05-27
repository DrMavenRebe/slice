# == Schema Information
#
# Table name: events_steps
#
#  created_at         :datetime         not null
#  daily_steps        :integer          default(0), not null
#  day_final          :boolean          default(FALSE), not null
#  id                 :integer          not null, primary key
#  last_event_step_id :integer
#  updated_at         :datetime         not null
#  user_id            :integer          not null
#

class Events::Step < ActiveRecord::Base
  validates :daily_steps, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :event_step, class_name: 'Events::Step', foreign_key: 'last_event_step_id'

  def user_aggregate(start_date, end_date)
    0
  end
end
