require 'rails_helper'

RSpec.describe "Podium::PodiumPlacers", type: :request do
  describe "GET /podium_podium_placers" do
    it "works! (now write some real specs)" do
      get podium_podium_placers_path
      expect(response).to have_http_status(200)
    end
  end
end
