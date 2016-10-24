require 'factory_girl_rails'

FactoryGirl.define do
  factory :condition do
    maxtemp 60
    mintemp 34
    precipitation 25
    humidity 60
    description 'Chilly with showers in the early morning.'
  end
end
