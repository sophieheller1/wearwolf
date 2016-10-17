require 'spec_helper'
require 'rails_helper'

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
  end
end
