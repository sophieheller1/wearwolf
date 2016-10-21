require 'rails_helper'
require 'spec_helper'
require 'factory_girl_rails'

describe 'User can' do
  let!(:user_1) { FactoryGirl.create(:user) }

  # feature 'add a location' do
  #   scenario 'user adds location successfully' do
  #     visit '/'
  #     fill_in 'Email', with: user_1.email
  #     fill_in 'Password', with: user_1.password
  #     click_button 'Log in'
  #     click_link 'Add a New Location'
  #     expect(page).to have_content 'Add a New Location'
  #
  #     fill_in 'City', with: 'Somerville'
  #     fill_in 'State', with: 'MA'
  #     fill_in 'Zip', with: '02143'
  #     fill_in 'Country', with: 'USA'
  #
  #     click_button 'Add Location'
  #     visit '/locations'
  #
  #     expect(page).to have_content 'Location created'
  #     expect(page).to have_content 'Somerville'
  #   end
  #
  #   scenario 'user does not provide proper location information' do
  #     visit '/'
  #     fill_in 'Email', with: user_1.email
  #     fill_in 'Password', with: user_1.password
  #     click_button 'Log in'
  #     click_link 'Add a New Location'
  #
  #     click_button 'Add Location'
  #     visit '/locations'
  #     expect(page).to have_content 'City can\'t be blank'
  #     expect(page).to have_content 'State can\'t be blank'
  #     expect(page).to have_content 'Zip can\'t be blank'
  #     expect(page).to have_content 'Country can\'t be blank'
  #     expect(page).to have_content 'Zip code is the wrong length
  #     (should be 5 characters)'
  #     expect(page).to have_content 'Zip code is not a number'
  #   end
  # end
end
