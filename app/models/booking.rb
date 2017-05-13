class Booking < ApplicationRecord
  validates :date_check_in, presence: true
  validates :date_check_out, presence: true
  validates :total_price, numericality: true, presence: true
  belongs_to :user
  belongs_to :boat
end
