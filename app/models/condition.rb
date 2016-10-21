class Condition < ActiveRecord::Base
  belongs_to :location
  has_many :suggestions
  has_many :garments, through: :suggestions

  validates :maxtemp, presence: true
  validates :mintemp, presence: true
  validates :precipitation, presence: true
  validates :humidity, presence: true

end
