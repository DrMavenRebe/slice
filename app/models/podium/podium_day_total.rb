# == Schema Information
#
# Table name: podium_podium_day_totals
#
#  created_at       :datetime         not null
#  id               :integer          not null, primary key
#  podium_placer_id :integer
#  total            :integer
#  updated_at       :datetime         not null
#

class Podium::PodiumDayTotal < ActiveRecord::Base
end
