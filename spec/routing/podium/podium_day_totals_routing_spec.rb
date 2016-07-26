# == Schema Information
#
# Table name: podium_podium_day_totals
#
#  created_at       :datetime         not null
#  id               :integer          not null, primary key
#  podium_placer_id :integer
#  total            :integer
#  updated_at       :datetime         not null
#

require "rails_helper"

RSpec.describe Podium::PodiumDayTotalsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/podium/podium_day_totals").to route_to("podium/podium_day_totals#index")
    end

    it "routes to #new" do
      expect(:get => "/podium/podium_day_totals/new").to route_to("podium/podium_day_totals#new")
    end

    it "routes to #show" do
      expect(:get => "/podium/podium_day_totals/1").to route_to("podium/podium_day_totals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/podium/podium_day_totals/1/edit").to route_to("podium/podium_day_totals#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/podium/podium_day_totals").to route_to("podium/podium_day_totals#create")
    end

    it "routes to #update" do
      expect(:put => "/podium/podium_day_totals/1").to route_to("podium/podium_day_totals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/podium/podium_day_totals/1").to route_to("podium/podium_day_totals#destroy", :id => "1")
    end

  end
end
