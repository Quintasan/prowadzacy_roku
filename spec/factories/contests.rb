# frozen_string_literal: true

FactoryBot.define do
  factory :contest do
    sequence(:name) { |n| "Contest ##{n}" }
    aasm_state "inactive"
    expires_at "2018-05-23 18:09:41"
  end
end
