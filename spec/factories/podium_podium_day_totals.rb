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

FactoryGirl.define do
  factory :podium_podium_day_total, :class => 'Podium::PodiumDayTotal' do
    podium_placer_id 1
total 1
  end

end
