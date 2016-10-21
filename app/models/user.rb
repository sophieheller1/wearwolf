class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  PREFERENCE = [
    ['cold', 'cold'], ['neutral', 'neutral'], ['hot', 'hot']
  ]

  GENDER = [
    'M', 'F'
  ]
end
