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

FactoryGirl.define do
  factory :user do
    email "regularuser@test.com"
    password "regularguypassword"
    password_confirmation "regularguypassword"
    name "dave"
    market "chicago"
    team "Tech"
    company "fooda"
    # association :fitbit_account
  end
end

