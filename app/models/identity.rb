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

class Identity < ActiveRecord::Base
  belongs_to :user

  def self.from_omniauth(auth)
    identity = Identity.where(provider: auth.provider, uid: auth.uid).first_or_create do |identity|
      identity.access_token = auth['credentials']['token']
      identity.refresh_token = auth['credentials']['refresh_token']
      identity.expires_at = auth['credentials']['expires_at']
      identity.timezone = auth['info']['timezone']
    end

    identity
  end
end
