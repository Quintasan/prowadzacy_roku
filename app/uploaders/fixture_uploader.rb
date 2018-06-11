# frozen_string_literal: true

class FixtureUploader < Shrine
  Shrine.plugin :cached_attachment_data
end
