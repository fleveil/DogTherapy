class Search < ApplicationRecord
  geocoded_by :address

  validates :date, :address, :radius, presence: true
  validate :date_not_in_past
  validates :radius, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def date_not_in_past
    errors.add(:date, "can't be in the past") if date < Date.today
  end
end
