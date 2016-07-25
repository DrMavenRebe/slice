require 'rails_helper'

RSpec.describe "podia/show", type: :view do
  before(:each) do
    @podium = assign(:podium, Podium.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
