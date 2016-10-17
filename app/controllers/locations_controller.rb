require './config/initializers/geolocation'
require './config/initializers/darksky'
require 'pry'

require 'dotenv-rails'
Dotenv.load

class LocationsController < ApplicationController

  def index  # automatically shows current location
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)  # maybe this is just because it's local, only getting bs ip
    # @geolocation = Geolocation.new('50.241.127.209')# this actually works, which means the code should be right
    @darksky = Darksky.new(@geolocation.latitude, @geolocation.longitude)
    render :index
  end

  def show # navigate to favorite, which is a location previously saved to database
    # click link to favorite ---> see saved location, probably need to add favorites column to user model or maybe just a favorites table?

    @location = Location.find(params[:id])
    @darksky = Darksky.new(@location.latitude, @location.longitude)

  end




end
