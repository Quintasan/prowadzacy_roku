# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "contestants/index", type: :view do
  before(:each) do
    assign(:contestants, [
             Contestant.create!,
             Contestant.create!
           ])
  end

  it "renders a list of contestants" do
    render
  end
end
