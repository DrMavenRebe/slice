require 'rails_helper'

RSpec.describe "podium/podium_day_totals/show", type: :view do
  before(:each) do
    @podium_podium_day_total = assign(:podium_podium_day_total, Podium::PodiumDayTotal.create!(
      :podium_placer_id => 1,
      :total => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
