require 'rails_helper'

describe GoogleGeocoding do
  it 'returns an array of hashes' do
  	VCR.use_cassette('fake_geocoding') do
  	  fake_geocoding = GoogleGeocoding.new('Somerville')
  	  expect(fake_geocoding.data).to be_a Hash
  	end
  end
end