require 'rails_helper'

describe Geolocation do
  it 'returns an array of hashes' do
  	VCR.use_cassette('fake_ip') do
  	  fake_ip = Geolocation.new('50.241.127.209')
  	  expect(fake_ip.city).to eq('Melrose')
  	end
  end
end