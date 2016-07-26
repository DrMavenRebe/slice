require 'rails_helper'

RSpec.describe "podium/podium_day_totals/edit", type: :view do
  before(:each) do
    @podium_podium_day_total = assign(:podium_podium_day_total, Podium::PodiumDayTotal.create!(
      :podium_placer_id => 1,
      :total => 1
    ))
  end

  it "renders the edit podium_podium_day_total form" do
    render

    assert_select "form[action=?][method=?]", podium_podium_day_total_path(@podium_podium_day_total), "post" do

      assert_select "input#podium_podium_day_total_podium_placer_id[name=?]", "podium_podium_day_total[podium_placer_id]"

      assert_select "input#podium_podium_day_total_total[name=?]", "podium_podium_day_total[total]"
    end
  end
end
