require 'json'
require 'net/http'

class Geolocation
  attr_reader :ip

  def initialize(ip)
    @ip = ip
    @data = get_location
    @data = default_location
  end

  def city
    @data['city']
  end

  def state
    @data['state']
  end

  def country
    @data['country_name']
  end

  private
  def get_location
    response = Net::HTTP.get_location(uri)
    JSON.parse(response.body)
  end

  def uri
    URI('http://freegeoip.net/json/#{@ip}')
  end

  def default_location
    {
      'ip' => @ip,
      'latitude' => 42.2848,
      'longitude' => -71.0741,
    }
  end
end
