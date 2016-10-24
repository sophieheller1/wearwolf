require 'spec_helper'
require 'rails_helper'

describe Location, type: :model do
  it { should have_valid(:city).when('Somerville', 'Rochester') }
  it { should_not have_valid(:city).when('', nil) }
  it { should have_valid(:state).when('Massachussetts', 'MA') }
  it { should_not have_valid(:state).when('', nil) }
  it { should have_valid(:zip).when('02143', '07626') }
  it { should_not have_valid(:zip).when('', nil) }
  it { should have_valid(:country).when('United States', 'USA') }
  it { should_not have_valid(:country).when('', nil) }

  describe '.city' do
    it 'returns the city of the location' do
      user = FactoryGirl.create(:user)
      location = FactoryGirl.create(:location, city: "Cresskill", user: user)
      city = location.city

      expect(city).to eq("Cresskill")
    end
  end

  describe '.state' do
    it 'returns the state of the location' do
      user = FactoryGirl.create(:user)
      location = FactoryGirl.create(:location, state: "Mordor", user: user)
      state = location.state

      expect(state).to eq("Mordor")
    end
  end

  describe '.zip' do
    it 'returns the zip of the location' do
      user = FactoryGirl.create(:user)
      location = FactoryGirl.create(:location, zip: "01234", user: user)
      zip = location.zip

      expect(zip).to eq("01234")
    end
  end

  describe '.country' do
    it 'returns the country of the location' do
      user = FactoryGirl.create(:user)
      location = FactoryGirl.create(:location, country: "Valor", user: user)
      country = location.country

      expect(country).to eq("Valor")
    end
  end
end
