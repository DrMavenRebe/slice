require 'rails_helper'

RSpec.describe "Podium::PodiumDayTotals", type: :request do
  describe "GET /podium_podium_day_totals" do
    it "works! (now write some real specs)" do
      get podium_podium_day_totals_path
      expect(response).to have_http_status(200)
    end
  end
end
