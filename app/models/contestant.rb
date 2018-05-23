class Contestant < ApplicationRecord
  validates :name, :surname, :title, presence: true
  validates :name, uniqueness: { scope: %i[surname title] }
end
