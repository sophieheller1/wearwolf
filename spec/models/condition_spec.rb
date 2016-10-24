require 'spec_helper'
require 'rails_helper'

describe Condition, type: :model do
  it { should have_valid(:maxtemp).when('87', '45') }
  it { should_not have_valid(:maxtemp).when('', nil) }
  it { should have_valid(:mintemp).when('64', '21') }
  it { should_not have_valid(:mintemp).when('', nil) }
  it { should have_valid(:precipitation).when('0', '90') }
  it { should_not have_valid(:precipitation).when('', nil) }
  it { should have_valid(:humidity).when('0', '74') }
  it { should_not have_valid(:humidity).when('', nil) }

  describe '.maxtemp' do
    it 'returns the maxtemp of the condition' do
      user = FactoryGirl.create(:user)
      location = FactoryGirl.create(:location, user: user)
      condition = FactoryGirl.create(:condition, maxtemp: 89, user: user, location: location)
      maxtemp = condition.maxtemp

      expect(maxtemp).to eq(89)
    end
  end

  describe '.mintemp' do
    it 'returns the mintemp of the condition' do
      user = FactoryGirl.create(:user)
      location = FactoryGirl.create(:location, user: user)
      condition = FactoryGirl.create(:condition, mintemp: 47, user: user, location: location)
      mintemp = condition.mintemp

      expect(mintemp).to eq(47)
    end
  end

  describe '.precipitation' do
    it 'returns the precipitation of the condition' do
      user = FactoryGirl.create(:user)
      location = FactoryGirl.create(:location, user: user)
      condition = FactoryGirl.create(:condition, precipitation: 40, user: user, location: location)
      precipitation = condition.precipitation

      expect(precipitation).to eq(40)
    end
  end

  describe '.humidity' do
    it 'returns the humidity of the condition' do
      user = FactoryGirl.create(:user)
      location = FactoryGirl.create(:location, user: user)
      condition = FactoryGirl.create(:condition, humidity: 75, user: user, location: location)
      humidity = condition.humidity

      expect(humidity).to eq(75)
    end
  end

  describe '.description' do
    it 'returns the description of the condition' do
      user = FactoryGirl.create(:user)
      location = FactoryGirl.create(:location, user: user)
      condition = FactoryGirl.create(:condition, description: 'Blustery with sun showers later in the day.', user: user, location: location)
  	  description = condition.description

  	  expect(description).to eq('Blustery with sun showers later in the day.')
    end
  end
end
