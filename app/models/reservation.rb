class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  attribute :status, :string, default: 'pending'

  validates :date, presence: true
  # validates :user_id, uniqueness: { scope: :dog_id } # limits to only 1 reservation per dog
  validate :date_not_in_past
  validates :status, inclusion: { in: %w[declined pending confirmed], message: "value is not a valid status" }

  private

  def date_not_in_past
    errors.add(:date, "can't be in the past") if date < Date.today
  end
end
