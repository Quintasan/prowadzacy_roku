class Fixture < ApplicationRecord
  include FixtureUploader[:file]
  include FixtureUploader[:students]
end
