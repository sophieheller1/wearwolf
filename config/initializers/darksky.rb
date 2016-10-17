require 'json'
require 'net/http'

class Darksky
  attr_reader :data

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
    @data = get_weather
  end

  def high
    @data['daily']['data'][0]['temperatureMax']
  end

  def low
    @data['daily']['data'][0]['temperatureMin']
  end

  def precipitation
    @data['daily']['data'][0]['precipProbability']
  end

  def humidity
    @data['daily']['data'][0]['humidity']
  end

  def summary
    @data['daily']['data'][0]['summary']
  end

  private

  def get_weather
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def uri
    URI("https://api.darksky.net/forecast/#{ENV['DARK_SKY_API_KEY']}/#{@latitude},#{@longitude}")
  end
end
