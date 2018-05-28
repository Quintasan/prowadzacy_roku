# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :contest
  belongs_to :contestant
  validates :contestant_id, uniqueness: { scope: :contest_id }
  has_many :votes, dependent: :restrict_with_error
end
