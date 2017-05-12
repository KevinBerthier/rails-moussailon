class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @booking.date_check_in
    @boat = Boat.find(params[:boat_id])
  end

  def create
    @booking.save
    redirect_to booking_path(@booking)
  end
end
