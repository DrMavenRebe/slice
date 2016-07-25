require 'rails_helper'

RSpec.describe "podia/edit", type: :view do
  before(:each) do
    @podium = assign(:podium, Podium.create!())
  end

  it "renders the edit podium form" do
    render

    assert_select "form[action=?][method=?]", podium_path(@podium), "post" do
    end
  end
end
