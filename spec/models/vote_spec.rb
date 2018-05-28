# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:token) }
    it { is_expected.to validate_presence_of(:email) }
  end
end
