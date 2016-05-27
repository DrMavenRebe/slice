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

require 'spec_helper'

RSpec.describe Events::StepsController, type: :controller do

end
