# frozen_string_literal: true

json.array! @contests, partial: 'contests/contest', as: :contest
