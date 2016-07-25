require 'rails_helper'

RSpec.describe "podia/new", type: :view do
  before(:each) do
    assign(:podium, Podium.new())
  end

  it "renders new podium form" do
    render

    assert_select "form[action=?][method=?]", podia_path, "post" do
    end
  end
end
