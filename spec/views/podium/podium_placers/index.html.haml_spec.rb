require 'rails_helper'

RSpec.describe "podium/podium_placers/index", type: :view do
  before(:each) do
    assign(:podium_podium_placers, [
      Podium::PodiumPlacer.create!(
        :place => 1,
        :podium_id => 2,
        :user_id => 3,
        :name => "Name"
      ),
      Podium::PodiumPlacer.create!(
        :place => 1,
        :podium_id => 2,
        :user_id => 3,
        :name => "Name"
      )
    ])
  end

  it "renders a list of podium/podium_placers" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
