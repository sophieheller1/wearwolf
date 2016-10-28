# README

![Build Status](https://codeship.com/projects/d3fd1ed0-750f-0134-0946-1eaf12e437c5/status?branch=master)
![Code Climate](https://codeclimate.com/github/sophieheller1/wearwolf.png)
![Coverage Status](https://coveralls.io/repos/sophieheller1/wearwolf/badge.png)

# WEARWOLF

Application Link: [wearwolf.herokuapp.com]

List of Features
----------------
* User sign-up/log-in with Devise
* Ability to see weather and suggestions at current location using IP address
* Ability to add new locations with Google Places Search Bar
* Weather report and clothing suggestions for all added locations generated by Google Geocoding and Dark Sky APIs
* Ability to account for personal temperature preference in recommendations


Outline of Technologies
-----------------------
* Ruby on Rails (2.3.1)
* Javascript
* PostgreSQL
* ActiveRecord
* Foundation & CSS
* RSpec & Capybara
* FactoryGirl
* Google Places API
* Google Geocoding API
* Dark Sky API


To Run Locally:
---------------
1. git clone https://github.com/sophieheller1/wearwolf.git
2. cd wearwolf
3. bundle install
4. rake db:create db:migrate
5. reference .env.example for necessary environment variables

