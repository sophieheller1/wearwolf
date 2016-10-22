class Condition < ActiveRecord::Base
  belongs_to :user

  validates :maxtemp, presence: true
  validates :mintemp, presence: true
  validates :precipitation, presence: true
  validates :humidity, presence: true

  WEATHERCOMBOS = [
    [1, 'above 80 and humid and rainy'],
    [2, 'above 80 and dry and rainy'],
    [3, 'above 80 and dry and not rainy'],
    # [4, 'above 80 and dry and not rainy'],
    # [3, 'above 80 and dry and not rainy'],
    # [3, 'above 80 and dry and not rainy'],
    # [3, 'above 80 and dry and not rainy'],
    # [3, 'above 80 and dry and not rainy'],
    # [3, 'above 80 and dry and not rainy'],
    # [3, 'above 80 and dry and not rainy'],
    # [3, 'above 80 and dry and not rainy'],
    # [3, 'above 80 and dry and not rainy'],
  ]

end
