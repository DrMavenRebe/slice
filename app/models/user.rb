# == Schema Information
#
# Table name: users
#
#  company                :string
#  created_at             :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  id                     :integer          not null, primary key
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  market                 :string
#  name                   :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0)
#  team                   :string
#  updated_at             :datetime
#

class User < ActiveRecord::Base

  has_many :events_steps, class_name: 'Events::Step'
  has_many :identities, :dependent => :destroy

  devise :registerable
  devise :omniauthable, :omniauth_providers => [:fitbit_oauth2]

  def linked?
    identities.where(provider: "fitbit_oauth2").any?
  end

  def identity_for(provider)
    identities.where(provider: provider).first
  end

  def fitbit_data
    fitbit_identity = identities.where(provider: 'fitbit_oauth2').first

    FitgemOauth2::Client.new(
      token: fitbit_identity.access_token,
      client_id: ENV['FITBIT_CLIENT_ID'],
      client_secret: ENV['FITBIT_CLIENT_SECRET'],
      user_id: fitbit_identity.uid)
  end

  def unit_measurement_mappings
    @unit_mappings ||= {
      :distance => @client.label_for_measurement(:distance),
      :duration => @client.label_for_measurement(:duration),
      :elevation => @client.label_for_measurement(:elevation),
      :height => @client.label_for_measurement(:height),
      :weight => @client.label_for_measurement(:weight),
      :measurements => @client.label_for_measurement(:measurements),
      :liquids => @client.label_for_measurement(:liquids),
      :blood_glucose => @client.label_for_measurement(:blood_glucose)
    }
  end
end
