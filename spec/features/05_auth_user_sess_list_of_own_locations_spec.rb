require 'rails_helper'
require 'spec_helper'

describe 'User can' do
  let!(:user_1) { FactoryGirl.create(:user) }

  feature 'see a list of own locations' do
    scenario 'user sees own locations on index page' do

    end
  end
end
