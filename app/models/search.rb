class Search < ApplicationRecord
  geocoded_by :address
  attribute :radius, :integer, default: 5

  validates :start_date, :end_date, :address, presence: true
  validate :start_date_not_in_past
  validate :end_date_not_before_start_date
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def start_date_not_in_past
    errors.add(:start_date, "can't be in the past") if start_date < Date.today
  end

  def end_date_not_before_start_date
    errors.add(:end_date, "can't be before start date") if start_date > end_date
  end
end
