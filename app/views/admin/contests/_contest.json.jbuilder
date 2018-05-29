# frozen_string_literal: true

json.extract! contest, :id, :created_at, :updated_at
json.url contest_url(contest, format: :json)
