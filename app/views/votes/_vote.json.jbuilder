# frozen_string_literal: true

json.extract! vote, :id, :created_at, :updated_at
json.url vote_url(vote, format: :json)
