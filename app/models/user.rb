# == Schema Information
#
# Table name: users
#
#  company    :string
#  created_at :datetime
#  email      :string           default(""), not null
#  id         :integer          not null, primary key
#  market     :string
#  name       :string           default(""), not null
#  team       :string
#  updated_at :datetime
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

  def fitbit_identity
    @fitbit_identity_memo ||= identities.where(provider: 'fitbit_oauth2').first
  end

  def fitbit_data
    FitgemOauth2::Client.new(
      token: fitbit_identity.access_token,
      client_id: ENV['FITBIT_CLIENT_ID'],
      client_secret: ENV['FITBIT_CLIENT_SECRET'],
      user_id: fitbit_identity.uid)
  end

  def refresh_fitbit_token!
    #FOR THE MOCK
    # Good response:
     # => {"access_token"=>"edJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI0OURZQkgiLCJhdWQiOiIyMjdSWEIiLCJpc3MiOiJGaXRiaXQiasJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJyc29jIHJhY3QgcnNldCBycHJvIHJudXQiLCJleHAiOjE0NzI2MzEwOTUsImlhdCI6MTQ3MjYwMjI5NX0.GyJ7daOzYgowM2krYgTN626CBaIUc6FJ5DxbAwzgxfdA", "expires_in"=>28800, "refresh_token"=>"3fb58bf62a44d197575d6d401adad1158ff10dc296d330ae12505848cd5d1ebc", "scope"=>"activity profile nutrition social settings", "token_type"=>"Bearer", "user_id"=>"49DYBH"} 
    #bad response
    # {"errors"=>[{"errorType"=>"invalid_grant", "message"=>"Refresh token invalid: a12409ccb6e75554458004f93e1db81087f104d6093005e7fca30fd88f887e854. Visit https://dev.fitbit.com/docs/oauth2 for more information on the Fitbit Web API authorization process."}], "success"=>false} 
    response = fitbit_data.refresh_access_token(fitbit_identity.refresh_token)
    fitbit_identity.update_attributes!(
      access_token: response['access_token'],
      refresh_token: response['refresh_token'])
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
