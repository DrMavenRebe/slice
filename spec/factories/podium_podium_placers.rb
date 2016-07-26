# == Schema Information
#
# Table name: podium_podium_placers
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  place      :integer
#  podium_id  :integer
#  updated_at :datetime         not null
#  user_id    :integer
#

FactoryGirl.define do
  factory :podium_podium_placer, :class => 'Podium::PodiumPlacer' do
    place 1
podium_id 1
user_id 1
name "MyString"
  end

end
