class Boat < ApplicationRecord
  include PgSearch

  after_validation :geocode, if: :address_changed?
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_attachments :photos, maximum: 3

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :price, numericality: true
  validates :capacity, numericality: true

  pg_search_scope :search_params, against: [ :city, :address, :capacity, :gender ]

  GENDER = ["", "Voilier", "Bateau à moteur", "Catamaran", "Semi-rigide", "Yacht"]
end
