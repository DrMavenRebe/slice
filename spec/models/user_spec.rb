# == Schema Information
#
# Table name: users
#
#  company                :string
#  created_at             :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  id                     :integer          not null, primary key
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  market                 :string
#  name                   :string           default(""), not null
#  oauth_secret           :string
#  oauth_token            :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0)
#  team                   :string
#  uid                    :string
#  updated_at             :datetime
#

require 'spec_helper'

describe User do

end
