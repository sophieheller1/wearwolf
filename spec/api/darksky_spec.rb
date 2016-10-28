require 'rails_helper'

describe Darksky do
  it 'returns an array of hashes' do
  	VCR.use_cassette('fake_weather') do
  	  fake_weather = Darksky.new(42.3601, 71.0589)
  	  expect(fake_weather.data).to be_a Hash
  	  expect(fake_weather.data['latitude']).to eq(42.3601)
  	end
  end
end

