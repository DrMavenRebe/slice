# == Schema Information
#
# Table name: podia
#
#  created_at  :datetime         not null
#  end_date_at :datetime         not null
#  id          :integer          not null, primary key
#  updated_at  :datetime         not null
#

require "rails_helper"

RSpec.describe PodiaController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/podia").to route_to("podia#index")
    end

    it "routes to #new" do
      expect(:get => "/podia/new").to route_to("podia#new")
    end

    it "routes to #show" do
      expect(:get => "/podia/1").to route_to("podia#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/podia/1/edit").to route_to("podia#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/podia").to route_to("podia#create")
    end

    it "routes to #update" do
      expect(:put => "/podia/1").to route_to("podia#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/podia/1").to route_to("podia#destroy", :id => "1")
    end

  end
end
