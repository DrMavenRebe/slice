# == Schema Information
#
# Table name: podium_podium_placers
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  place      :integer
#  podium_id  :integer
#  updated_at :datetime         not null
#  user_id    :integer
#

require "rails_helper"

RSpec.describe Podium::PodiumPlacersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/podium/podium_placers").to route_to("podium/podium_placers#index")
    end

    it "routes to #new" do
      expect(:get => "/podium/podium_placers/new").to route_to("podium/podium_placers#new")
    end

    it "routes to #show" do
      expect(:get => "/podium/podium_placers/1").to route_to("podium/podium_placers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/podium/podium_placers/1/edit").to route_to("podium/podium_placers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/podium/podium_placers").to route_to("podium/podium_placers#create")
    end

    it "routes to #update" do
      expect(:put => "/podium/podium_placers/1").to route_to("podium/podium_placers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/podium/podium_placers/1").to route_to("podium/podium_placers#destroy", :id => "1")
    end

  end
end
