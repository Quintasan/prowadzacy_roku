FactoryBot.define do
  factory :entry do
    association :contest
    association :contestant
  end
end
