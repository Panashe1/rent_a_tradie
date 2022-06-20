class BookingsController < ApplicationController
  def new
    @service = Service.find(params[:service_id])
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @service = Service.find(params[:service_id])
    @booking.service = @service
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end
end
