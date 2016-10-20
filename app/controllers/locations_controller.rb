require './config/initializers/geolocation'
require './config/initializers/darksky'
require './config/initializers/google_geocoding'

require 'dotenv-rails'
Dotenv.load

class LocationsController < ApplicationController

  def index  # automatically shows current location
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
    # @ip = request.ip
    # @geolocation = Geolocation.new(@ip)  # maybe this is just because it's local, only getting bs ip
    # # @geolocation = Geolocation.new('50.241.127.209')# this actually works, which means the code should be right
    # @darksky = Darksky.new(@geolocation.latitude, @geolocation.longitude)

    render :index
  end

  def show
    @user = current_user
    @location = Location.find(params[:id])
  end

  def new
    if user_signed_in?
      @location = Location.new
    else
      flash[:notice] = "You must be signed in to create a location."
      redirect_to new_user_session_path
    end
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user

    if @location.save
      flash[:notice] = "Location created."
      redirect_to location_path(@location)
    else
      flash[:notice] = @location.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(:city, :state, :zip, :country, :latitude, :longtitude)
  end



end
