require 'rails_helper'
require 'spec_helper'

describe 'User can' do
  let!(:user_1) { FactoryGirl.create(:user) }
  let!(:location_1) { FactoryGirl.create(:location, user_id: user_1.id) }

  feature 'visit a location and see the clothing suggestions' do
    scenario 'user visits location' do
      visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log in'

      click_link location_1.city

      expect(page).to have_content location_1.city
      expect(page).to have_content 'Click for wolf advice'
    end

   scenario 'user clicks to see weather' do
   	  visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log in'

      click_link location_1.city
      click_button 'Wolf Advice'
      wait_for_ajax

      expect(page).to have_content('High')
      expect(page).to have_content('Humidity')
      expect(page).to not_have selector('wolf-image')
   end

   scenario 'user sees wolf advice' do
	  visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log in'

      click_link location_1.city
      click_button 'Wolf Advice'
      wait_for_ajax

      expect(page).to have_selector('wolf-advice')
   end
  end
end
