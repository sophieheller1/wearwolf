require 'spec_helper'
require 'rails_helper'
require 'factory_girl_rails'

describe 'Auth user can update profile' do

  let!(:user_1) { FactoryGirl.create(:user) }

  feature 'User edits own profile' do

    scenario 'User sees profile link' do
      visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log in'

      expect(page).to have_button 'Your profile'
    end

    scenario 'User changes favorite vacation spot' do
      visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log in'
      click_button 'Your profile'
      fill_in 'Favorite Vacation Spot', with: 'Boston'
      choose 'cold'
      click_button 'Update your profile'
      expect(page).to have_content 'Profile updated successfully.'

      click_button 'Your profile'

      find_field('Favorite Vacation Spot').value.should eq 'Boston'
      expect(page).to have_content 'cold'

    end
  end


end
