require 'rails_helper'
require 'spec_helper'
require 'factory_girl_rails'

describe 'User can' do

  feature 'see a list of own locations' do
    scenario 'user sees own locations on index page' do
      user_1 = FactoryGirl.create(:user)
      user_2 = FactoryGirl.create(:user)
      location_1 = FactoryGirl.create(:location, user_id: user_1.id)
      location_2 = FactoryGirl.create(:location, user_id: user_1.id)
      location_3 = FactoryGirl.create(:location, user_id: user_2.id)

      visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log in'

      expect(page).to have_content location_1.city
      expect(page).to have_content location_2.city
      expect(page).to_not have_content location_3.city
    end
  end
end
