# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entry, type: :model do
  context 'validations' do
    before do
      contest = create(:contest)
      contestant = create(:contestant)
      create(:entry, contest: contest, contestant: contestant)
    end

    it { is_expected.to validate_uniqueness_of(:contestant_id).scoped_to(:contest_id) }
  end
end
