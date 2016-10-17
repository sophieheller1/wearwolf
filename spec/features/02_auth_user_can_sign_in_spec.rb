require 'spec_helper'
require 'rails_helper'
require 'factory_girl_rails'

describe 'Auth user can sign in' do

  let!(:user_1) { FactoryGirl.create(:user) }

  feature 'Auth user can log in' do

    scenario 'User sees login button in header' do
      visit '/'
      expect(page).to have_button 'Log in'
    end

    scenario 'User can click login button and login' do
      visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log in'

      expect(page).to have_content("Signed in as #{user_1.email}")
    end

    scenario 'Logged in User can log out from button in header' do
      visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log in'
      click_button 'Log Out'

      expect(page).to have_button 'Log in'
    end

    scenario 'User enters incorrect password and cannot login' do
      visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: 'randompassword'
      click_button 'Log in'

      expect(page).to_not have_content("Signed in as #{user_1.email}")
    end

  end


end
