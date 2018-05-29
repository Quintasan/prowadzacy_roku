require 'rails_helper'

RSpec.describe "fixtures/index", type: :view do
  before(:each) do
    assign(:fixtures, [
      Fixture.create!(),
      Fixture.create!()
    ])
  end

  it "renders a list of fixtures" do
    render
  end
end
