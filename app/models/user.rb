class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :conditions

  PREFERENCE = [
    ['cold', 'cold'], ['neutral', 'neutral'], ['hot', 'hot']
  ]

  GENDER = [
    'M', 'F'
  ]
end
