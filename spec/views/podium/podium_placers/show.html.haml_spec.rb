require 'rails_helper'

RSpec.describe "podium/podium_placers/show", type: :view do
  before(:each) do
    @podium_podium_placer = assign(:podium_podium_placer, Podium::PodiumPlacer.create!(
      :place => 1,
      :podium_id => 2,
      :user_id => 3,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Name/)
  end
end
