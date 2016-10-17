require 'json'
require 'net/http'

class Geolocation
  attr_reader :ip

  def initialize(ip)
    @ip = ip
    @data = get_location
    # @data = default_location if city.empty?
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
    # URI.parse(URI.encode("http://freegeoip.net/json/#{@ip}"))
    URI("http://freegeoip.net/json/#{@ip}")
  end

  # def default_location
  #   {
  #     'ip' => @ip,
  #     'latitude' => 32.6785,
  #     'longitude' => 91.1826,
  #     'city' => 'Transylvania'
  #   }
  # end
end
