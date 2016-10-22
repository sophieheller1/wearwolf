module WolfAdvice
  extend ActiveSupport::Concern

  def get_wolf_advice
    "hi"
  end

  def find_temp_range

  end

  def is_rainy?
    @current_condition.precipitation >= 40%
  end

  def is_humid?
    @current_condition.humidity >= 50%
  end
end
