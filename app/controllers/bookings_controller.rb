class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

    # GET /bookings/1
  def show

  end

  def new
    @booking = Booking.new
    @boat = Boat.find(params[:boat_id])
    @booking.date_check_in = params[:date_check_in].to_date
    @booking.date_check_out = params[:date_check_out].to_date
    @booking.total_price =
    @boat.price * (@booking.date_check_out - @booking.date_check_in + 1)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.boat = Boat.find(params[:boat_id])
    @booking.total_price =
    @booking.boat.price * (@booking.date_check_out - @booking.date_check_in + 1)
    @booking.save
    if @booking.save
      redirect_to dashboard_path, notice: 'booking was successfully created.'
    else
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'booking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'booking was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = booking.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def booking_params
    params.require(:booking).permit(:date_check_in, :date_check_out, :total_price)
  end
end



