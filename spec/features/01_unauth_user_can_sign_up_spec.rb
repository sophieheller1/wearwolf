require 'spec_helper'
require 'rails_helper'
require 'factory_girl_rails'

describe 'Unauth user can sign in' do
  feature 'Unauth user can sign up' do

     scenario 'User sees sign up button in header' do
       visit '/'
       expect(page).to have_link 'Sign up'
     end

     scenario 'User can click sign up button' do
       visit '/'
       click_link 'Sign up'

       expect(page).to have_field('Email')
       expect(page).to have_field('Password')
       expect(page).to have_field('Password confirmation')
     end

     scenario 'User enters information to sign up' do
       visit '/'
       click_link 'Sign up'

       fill_in 'Email', with: 'test_wolf@gmail.com'
       fill_in 'Password', with: 'testwolf'
       fill_in 'Password confirmation', with: 'testwolf'

       click_button 'Sign up'

       expect(page).to have_content('Signed in as test_wolf@gmail.com')
     end

     scenario 'User enters email that is already in system' do
       test_wolf = FactoryGirl.create(:user)

       visit '/'
       click_link 'Sign up'

       fill_in 'Email', with: test_wolf.email
       fill_in 'Password', with: test_wolf.password
       fill_in 'Password confirmation', with: test_wolf.password

       click_button 'Sign up'

       expect(page).to have_content('Email has already been taken')
     end

     scenario 'User enters a password confirmation that does not match password' do
      visit '/'
      click_link 'Sign up'

      fill_in 'Email', with: 'another-test-wolf@gmail.com'
      fill_in 'Password', with: 'testwolf'
      fill_in 'Password confirmation', with: 'blahbl'

      click_button 'Sign up'

      expect(page).to have_content(
        'Password confirmation doesn\'t match Password'
      )
    end

    scenario 'User enters a password that is too short' do
      visit '/'
      click_link 'Sign up'

      fill_in 'Email', with: 'yet-another-test-wolf@gmail.com'
      fill_in 'Password', with: 'wolf'
      fill_in 'Password confirmation', with: 'wolf'

      click_button 'Sign up'

      expect(page).to have_content('Password is too short (minimum is 6 characters)')
    end

  end
end
