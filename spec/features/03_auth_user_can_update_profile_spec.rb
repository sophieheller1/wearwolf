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

    scenario 'User changes favorite location' do
      visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log in'
      click_button 'Your profile'
      fill_in 'Favorite location', with: 'Boston'
      choose 'cold'
      choose 'F'

      render 'locations/users/' + user.id + 'edit'

      expect(page).to have_content 'Profile updated successfully.'
      expect(page).to have_content 'Boston'
      expect(page).to have_content 'cold'
      expect(page).to have_content 'F'

    end
  end


end
