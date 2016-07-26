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

class Podium::PodiumPlacer < ActiveRecord::Base
end
