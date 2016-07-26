require 'rails_helper'

RSpec.describe "podium/podium_placers/new", type: :view do
  before(:each) do
    assign(:podium_podium_placer, Podium::PodiumPlacer.new(
      :place => 1,
      :podium_id => 1,
      :user_id => 1,
      :name => "MyString"
    ))
  end

  it "renders new podium_podium_placer form" do
    render

    assert_select "form[action=?][method=?]", podium_podium_placers_path, "post" do

      assert_select "input#podium_podium_placer_place[name=?]", "podium_podium_placer[place]"

      assert_select "input#podium_podium_placer_podium_id[name=?]", "podium_podium_placer[podium_id]"

      assert_select "input#podium_podium_placer_user_id[name=?]", "podium_podium_placer[user_id]"

      assert_select "input#podium_podium_placer_name[name=?]", "podium_podium_placer[name]"
    end
  end
end
