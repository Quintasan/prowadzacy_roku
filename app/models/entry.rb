class Entry < ApplicationRecord
  belongs_to :contest
  belongs_to :contestant
  validates :contestant_id, uniqueness: { scope: :contest_id }
end
