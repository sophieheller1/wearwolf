require './config/initializers/geolocation'
require './config/initializers/darksky'
require 'pry'

require 'dotenv-rails'
Dotenv.load

class LocationsController < ApplicationController
  include WolfAdvice

  def index  # automatically shows current location

    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)
    @darksky = Darksky.new(@geolocation.latitude, @geolocation.longitude)

    @locations = Location.where(user_id: @user.id)

    render :index
  end

  def show
    @user = current_user
    @location = Location.find(params[:id])

    user_conditions = Condition.where(user_id: @user.id)
    @current_condition = user_conditions.order('created_at').last


    @wolf_advice = display_wolf_advice

    @weathercombos = Condition::WEATHERCOMBOS

    # if @condition.maxtemp >= 80
    #   if @condition.humidity >= 50%
    #     if @condition.precipitation >= 40%
    #       best_fit = @weathercombos[0]
    #     elsif @condition.precipitation < 40%
    #       best_fit = @weathercombos[2]
    #     end
    #   elsif @condition.humidity < 50%
    #     best_fit = @weathercombos[1]
    #   end
    # end


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
      redirect_to location_path(@location)
      flash[:notice] = "Location created."
    else
      flash[:notice] = @location.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(:user, :city, :state, :zip, :country, :latitude, :longtitude)
  end



end
