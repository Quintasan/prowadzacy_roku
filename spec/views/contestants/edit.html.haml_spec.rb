# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "contestants/edit", type: :view do
  before(:each) do
    @contestant = assign(:contestant, Contestant.create!)
  end

  it "renders the edit contestant form" do
    render

    assert_select "form[action=?][method=?]", contestant_path(@contestant), "post" do
    end
  end
end
