# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contest, type: :model do
  context 'validations' do
    subject { FactoryBot.create(:contest) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context 'state machine' do
    subject { FactoryBot.create(:contest) }
    it { is_expected.to transition_from(:inactive).to(:active).on_event(:activate) }
    it { is_expected.to allow_event(:activate) }
    it { is_expected.to transition_from(:finished).to(:active).on_event(:activate) }
    it { is_expected.not_to allow_event(:finish) }
    it { is_expected.to transition_from(:active).to(:finished).on_event(:finish) }
  end
end
