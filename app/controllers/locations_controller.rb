require './config/initializers/geolocation'
require './config/initializers/darksky'
require 'pry'

require 'dotenv-rails'
Dotenv.load

class LocationsController < ApplicationController

  def index
    @ip = request.ip
    # @geolocation = Geolocation.new(@ip)
    @darksky = Darksky.new(42.3601, 71.0589)

    render :index
  end








end
