# frozen_string_literal: true

class Fixture < ApplicationRecord
  include FixtureUploader[:file]
  include FixtureUploader[:students]
end
