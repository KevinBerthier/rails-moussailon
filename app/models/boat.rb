class Boat < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :address, uniqueness: true, presence: true
  validates :city, presence: true
end
