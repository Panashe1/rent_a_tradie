class PagesController < ApplicationController
  def home
    if params[:category].present?
      @services = Service.where("category LIKE ?", "%#{params[:category].capitalize}%")
    else
      @services = Service.all
    end
  end


end
