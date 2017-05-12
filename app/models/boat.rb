class Boat < ApplicationRecord
  GENDER = ["Voilier", "Bateau à moteur", "Catamaran", "Semi-rigide", "Yacht"]
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :price, numericality: true
  validates :capacity, numericality: true
  has_attachments :photos, maximum: 3
end
