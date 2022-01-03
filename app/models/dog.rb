class Dog < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, :breed, :energy, :affection, :size, :hypoallergenic, :location, :description, presence: true
  validates :description, length: { in: 1..300 }
  validates :name, length: { in: 1..15 }
  validates :energy, :affection, :size, length: { in: 1..5 }
end
