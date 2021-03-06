# frozen_string_literal: true

class Contestant < ApplicationRecord
  validates :name, :surname, :title, presence: true
  validates :name, uniqueness: { scope: %i[surname title] }
  has_many :entries, dependent: :destroy
  has_many :contests, through: :entries

  def full_name
    "#{surname} #{name}, #{title}"
  end
end
