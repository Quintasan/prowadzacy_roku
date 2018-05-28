# frozen_string_literal: true

FactoryBot.define do
  factory :entry do
    association :contest
    association :contestant
  end
end
