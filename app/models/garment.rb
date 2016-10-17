class Garment < ActiveRecord::Base
  has_many :suggestions
  has_many :conditions, through: :suggestions

  validates :name, presence: true
end
