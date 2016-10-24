require 'spec_helper'
require 'rails_helper'

feature 'google results', vcr: true do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:location) { FactoryGirl.create(:location, user: user, latitude: 42.3808757, longitude: -71.1002881) }

  scenario 'google api makes call to find weather' do
    visit "/locations/#{location.id}"
    click_link('Get the weather')

    expect(page).to have_content("High")
    expect(page).to have_content("Humidity")
  end
end
