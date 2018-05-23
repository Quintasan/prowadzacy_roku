class Contest < ApplicationRecord
  include AASM

  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :entries, dependent: :destroy
  has_many :contestants, through: :entries
  has_many :votes, dependent: :restrict_with_error

  aasm do
    state :inactive, initial: true
    state :active
    state :finished

    event :activate do
      transitions from: %i[inactive finished], to: :active, if: :no_other_contest_is_active?
    end

    event :finish do
      transitions from: :active, to: :finished
    end
  end

  def no_other_contest_is_active?
    self.class.active.count.zero?
  end
end
