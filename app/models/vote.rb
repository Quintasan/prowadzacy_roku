# frozen_string_literal: true

class Vote < ApplicationRecord
  has_secure_token
  validates :email, presence: true
  belongs_to :contest
  belongs_to :entry, optional: true
end
