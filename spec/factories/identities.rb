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

FactoryGirl.define do
  factory :identity do
    
  end
end
