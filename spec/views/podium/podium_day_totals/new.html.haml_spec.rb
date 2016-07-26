require 'rails_helper'

RSpec.describe "podium/podium_day_totals/new", type: :view do
  before(:each) do
    assign(:podium_podium_day_total, Podium::PodiumDayTotal.new(
      :podium_placer_id => 1,
      :total => 1
    ))
  end

  it "renders new podium_podium_day_total form" do
    render

    assert_select "form[action=?][method=?]", podium_podium_day_totals_path, "post" do

      assert_select "input#podium_podium_day_total_podium_placer_id[name=?]", "podium_podium_day_total[podium_placer_id]"

      assert_select "input#podium_podium_day_total_total[name=?]", "podium_podium_day_total[total]"
    end
  end
end
