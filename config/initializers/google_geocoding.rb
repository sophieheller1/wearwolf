require 'json'
require 'net/http'

class GoogleGeocoding
  attr_reader :data

  def initalize(city)
    @city = city
    @data = get_coordinates
  end

  def latitude
    @data['results']['address_components']['geometry']['location']['lat']
  end

  # def longitude
  #
  # end

  private

  def get_coordinates
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def uri
    URI("https://maps.googleapis.com/maps/api/geocode/json?address=#{@city}&key=#{ENV['GOOGLE_MAPS_GEOCODING_API_KEY']}")
  end



end
