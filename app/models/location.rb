class Location < ActiveRecord::Base
  belongs_to :user
  has_many :conditions

  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, numericality: { only_integer: true }, length: { is: 5 }
  validates :country, presence: true

end
