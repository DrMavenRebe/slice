# == Schema Information
#
# Table name: podia
#
#  created_at  :datetime         not null
#  end_date_at :datetime         not null
#  id          :integer          not null, primary key
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :podium do
    end_date_at "2016-07-25 18:51:29"
  end

end
