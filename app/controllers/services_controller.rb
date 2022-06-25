class ServicesController < ApplicationController
  before_action :authenticate_user!

  def new
    @service = Service.new

  end

  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to "/users/#{current_user.id}"
    else
      render :new
    end
  end

  def show
    find_service
    @booking = Booking.new
  end

  def edit
    find_service
  end

  def update
    find_service
    @service.update(service_params)
  end

  def destroy
    find_service
    @service.destroy
    redirect_to root_path
  end

  private

  def service_params
    params.require(:service).permit(:category, :description, :cost, :average_rating, :title, :user_id)
  end

  def find_service
    @service = Service.find(params[:id])
  end
end
