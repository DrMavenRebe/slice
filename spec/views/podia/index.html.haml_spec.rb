require 'rails_helper'

RSpec.describe "podia/index", type: :view do
  before(:each) do
    assign(:podia, [
      Podium.create!(),
      Podium.create!()
    ])
  end

  it "renders a list of podia" do
    render
  end
end
