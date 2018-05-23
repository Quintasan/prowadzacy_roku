class Vote < ApplicationRecord
  validates :token, :email, presence: true
  belongs_to :contest
  belongs_to :entry, optional: true
end
