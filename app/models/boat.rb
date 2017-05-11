class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, uniqueness: true, presence: true
  validates :address, uniqueness: true, presence: true
  validates :city, uniqueness: true, presence: true
end
