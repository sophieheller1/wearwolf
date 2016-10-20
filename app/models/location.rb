class Location < ActiveRecord::Base
  belongs_to :user

  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, numericality: { only_integer: true }, length: { is: 5 }
  validates :country, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

end
