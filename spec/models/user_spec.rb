require 'spec_helper'
require 'rails_helper'

describe User, type: :model do
  it { should have_valid(:email).when('testwolf@gmail.com', 'testwolfmom@gmail.com') }
  it { should_not have_valid(:email).when('', nil) }


  describe '.email' do
    it 'returns the email of the user' do
      user = FactoryGirl.create(:user, email: "snapeloveslily@gmail.com")
  	  email = user.email

  	  expect(email).to eq("snapeloveslily@gmail.com")
    end
  end

  describe '.password' do
    it 'returns the password of the user' do
      user = FactoryGirl.create(:user, password: "horcrux123", password_confirmation: "horcrux123")
  	  password = user.password

  	  expect(password).to eq("horcrux123")
    end
  end
end
