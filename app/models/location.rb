class Location < ActiveRecord::Base
  include WolfAdvice
  
  belongs_to :user

  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, numericality: { only_integer: true }, length: { is: 5 }
  validates :country, presence: true
end
