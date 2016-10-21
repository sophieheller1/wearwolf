require 'factory_girl_rails'

FactoryGirl.define do
  factory :location do
    sequence(:city) { |n| "Fake City #{n}"}
    state "Rohan"
    zip "01234"
    country "Middle Earth"
  end
end
