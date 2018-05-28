# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "contestants/new", type: :view do
  before(:each) do
    assign(:contestant, Contestant.new)
  end

  it "renders new contestant form" do
    render

    assert_select "form[action=?][method=?]", contestants_path, "post" do
    end
  end
end
