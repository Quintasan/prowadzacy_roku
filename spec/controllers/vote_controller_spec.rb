# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VoteController, type: :controller do
  describe "GET #vote" do
    it "returns http success" do
      get :vote
      expect(response).to have_http_status(:success)
    end
  end
end
