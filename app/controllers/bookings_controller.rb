class BookingsController < ApplicationController
  def new
    @service = Service.find(params[:service_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.service = @service
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :comment, :user_id)
  end
end
