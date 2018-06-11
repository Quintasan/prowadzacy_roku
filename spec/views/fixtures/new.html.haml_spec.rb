# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "fixtures/new", type: :view do
  before(:each) do
    assign(:fixture, Fixture.new)
  end

  it "renders new fixture form" do
    render

    assert_select "form[action=?][method=?]", fixtures_path, "post" do
    end
  end
end
