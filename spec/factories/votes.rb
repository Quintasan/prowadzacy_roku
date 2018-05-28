# frozen_string_literal: true

FactoryBot.define do
  factory :vote do
    token "MyString"
    cast false
    email "MyString"
    contest nil
  end
end
