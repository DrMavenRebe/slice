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

require 'rails_helper'

RSpec.describe Podium::PodiumDayTotal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
