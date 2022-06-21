class ServicesController < ApplicationController

  def new
    @service = Service.new
    @booking = Booking.new

  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to services_path
    else
      render :new
    end
  end

  def show
    find_service
  end

  def edit
    find_service
  end

  def update
    find_service
    @service.update(service_params);
  end

  def destroy
    find_service
    @service.destroy
    redirect_to services_path
  end

  private

  def service_params
    params.require(:service).permit(:category, :description, :cost, :average_rating, :title, :user_id)
  end

  def find_service
    @service = Service.find(params[:id])
  end
end
