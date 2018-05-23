class Contestant < ApplicationRecord
  validates :name, :surname, :title, presence: true
  validates :name, uniqueness: { scope: %i[surname title] }
  has_many :entries, dependent: :destroy
  has_many :contests, through: :entries
end
