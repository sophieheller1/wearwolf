require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test_wolf#{n}@gmail.com"}
    password "test-password"
  end
end
