require 'rails_helper'

RSpec.describe "fixtures/show", type: :view do
  before(:each) do
    @fixture = assign(:fixture, Fixture.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
