# frozen_string_literal: true

json.extract! fixture, :id, :created_at, :updated_at
json.url fixture_url(fixture, format: :json)
