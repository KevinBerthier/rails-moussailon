class Boat < ApplicationRecord
  belongs_to :user
  validates :name, uniqueness: true, presence: true
  validates :address, uniqueness: true, presence: true
  validates :city, uniqueness: true, presence: true
end
