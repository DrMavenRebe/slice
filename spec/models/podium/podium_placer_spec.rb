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

require 'rails_helper'

RSpec.describe Podium::PodiumPlacer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
