require 'rails_helper'

RSpec.describe "podium/podium_day_totals/index", type: :view do
  before(:each) do
    assign(:podium_podium_day_totals, [
      Podium::PodiumDayTotal.create!(
        :podium_placer_id => 1,
        :total => 2
      ),
      Podium::PodiumDayTotal.create!(
        :podium_placer_id => 1,
        :total => 2
      )
    ])
  end

  it "renders a list of podium/podium_day_totals" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
