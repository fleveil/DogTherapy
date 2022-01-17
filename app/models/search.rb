class Search < ApplicationRecord
  geocoded_by :address

  validates :start_date, :end_date, :address, :radius, presence: true
  validate :start_date_not_in_past
  validate :end_date_not_before_start_date
  validates :radius, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def start_date_not_in_past
    errors.add(:start_date, "can't be in the past") if start_date < Date.today
  end

  def end_date_not_before_start_date
    errors.add(:end_date, "can't be before start date") if start_date > end_date
  end
end
