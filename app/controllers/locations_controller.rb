require './config/initializers/geolocation'
require './config/initializers/darksky'

require 'dotenv-rails'
Dotenv.load

class LocationsController < ApplicationController

  def index
    @ip = request.ip

    render :index
  end

  def show
    @location = Location.find(params[:id])
    @darksky = Darksky.new(@location.latitude, @location.longitude)

  end




end
