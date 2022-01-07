class Dog < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :photo

  validates :name, :breed, :energy, :affection, :size, :hypoallergenic, :address, :description, presence: true
  validates :description, length: { in: 1..300 }
  validates :name, length: { in: 1..15 }
  validates :energy, :affection, :size, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
