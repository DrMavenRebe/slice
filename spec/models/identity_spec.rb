# == Schema Information
#
# Table name: identities
#
#  access_token  :string
#  created_at    :datetime         not null
#  expires_at    :integer
#  id            :integer          not null, primary key
#  provider      :string
#  refresh_token :string
#  timezone      :string
#  uid           :string
#  updated_at    :datetime         not null
#  user_id       :integer
#

require 'rails_helper'

RSpec.describe Identity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
