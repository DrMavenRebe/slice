# == Schema Information
#
# Table name: podia
#
#  created_at  :datetime         not null
#  end_date_at :datetime         not null
#  id          :integer          not null, primary key
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe "Podia", type: :request do
  describe "GET /podia" do
    it "works! (now write some real specs)" do
      get podia_path
      expect(response).to have_http_status(200)
    end
  end
end
