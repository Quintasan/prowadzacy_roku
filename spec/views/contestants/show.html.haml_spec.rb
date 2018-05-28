# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "contestants/show", type: :view do
  before(:each) do
    @contestant = assign(:contestant, Contestant.create!)
  end

  it "renders attributes in <p>" do
    render
  end
end
