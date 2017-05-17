class Boat < ApplicationRecord
  GENDER = ["Voilier", "Bateau à moteur", "Catamaran", "Semi-rigide", "Yacht"]
  after_validation :geocode, if: :address_changed?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :price, numericality: true
  validates :capacity, numericality: true
  has_attachments :photos, maximum: 3
  include PgSearch
  pg_search_scope :search_params, against: [ :city, :address, :capacity, :gender ]
  geocoded_by :address
end
