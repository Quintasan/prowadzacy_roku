# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "fixtures/edit", type: :view do
  before(:each) do
    @fixture = assign(:fixture, Fixture.create!)
  end

  it "renders the edit fixture form" do
    render

    assert_select "form[action=?][method=?]", fixture_path(@fixture), "post" do
    end
  end
end
