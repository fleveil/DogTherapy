class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  attribute :status, :string, default: 'pending'

  validates :start_date, :end_date, presence: true
  validates :user_id, uniqueness: { scope: :dog_id }
  validate :start_date_not_in_past
  validate :end_date_not_before_start_date
  validates :status, inclusion: { in: %w[declined pending confirmed], message: "value is not a valid status" }

  private

  def start_date_not_in_past
    errors.add(:start_date, "can't be in the past") if start_date < Date.today
  end

  def end_date_not_before_start_date
    errors.add(:end_date, "can't be before start date") if start_date > end_date
  end
end
