class Dog < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :photo
  geocoded_by :address

  validates :name, :breed, :energy, :affection, :size, :address, :description, presence: true
  validates :hypoallergenic, inclusion: { in: [true, false] }
  validates :description, length: { in: 1..600 }
  validates :name, length: { in: 1..15 }
  validates :energy, :affection, :size, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  after_validation :geocode, if: :will_save_change_to_address?
end
