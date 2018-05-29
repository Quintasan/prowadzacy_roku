# frozen_string_literal: true

json.extract! contestant, :id, :created_at, :updated_at
json.url contestant_url(contestant, format: :json)
