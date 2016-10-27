require 'json'
require 'net/http'

class Geolocation
  attr_reader :ip, :city

  def initialize(ip)
    @ip = ip
    @data = get_location
  end

  def city
    @data['city']
  end

  def latitude
    @data['latitude']
  end

  def longitude
    @data['longitude']
  end

  private
  def get_location
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def uri
    URI("http://freegeoip.net/json/#{@ip}")
  end
end
