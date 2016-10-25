# require 'rails_helper'
# require 'net/http'
# require 'vcr'
#
# require 'dotenv-rails'
# Dotenv.load
#
# describe GoogleGeocoding, :vcr do
#   it "returns the latitude and longitude of an entered zip" do
#     VCR.use_cassette("google_geocoding") do
#       uri = URI("https://maps.googleapis.com/maps/api/geocode/json?address=02143&key=#{ENV['GOOGLE_MAPS_GEOCODING_API_KEY']}")
#       response = Net::HTTP.get_response(uri)
#       JSON.parse(response.body)
#       expect(response.body['results']['address_components']['geometry']['location']['lat']).to eq 42.3808757
#       # expect(response.body['results']['address_components']['geometry']['location']['lng']).to eq -71.1002881
#     end
#   end
# end
