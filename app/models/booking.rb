class Booking < ApplicationRecord
  validates :date_check_in, uniqueness: true, presence: true
  validates :date_check_out, uniqueness: true, presence: true
  belongs_to :user
  belongs_to :boat
end
