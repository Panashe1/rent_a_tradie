class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookings = Booking.all
  end

  def new
    @service = Service.find(params[:service_id])
    @booking = Booking.new(booking_params)
    @booking.service = @service
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = Booking.new(booking_params)
    @booking.service = @service
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id]);
    @booking.destroy
    redirect_to "/users/#{current_user.id}"

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :comments, :user_id, :service_id)
  end
end
