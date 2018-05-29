class FixtureUploader < Shrine
  Shrine.plugin :cached_attachment_data
end
