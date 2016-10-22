module WolfAdvice
  extend ActiveSupport::Concern

  def get_wolf_advice
    get_weather_commentary
    wolf_says = ""
    if really_hot?
      wolf_says += "It's scorching! You should wear a T-shirt, shorts, and little else."
    end
  end


  def get_weather_commentary
    weather_commentary = ""
    if is_rainy? && is_humid?
      weather_commentary += "It's raining and humid. What a gross day! "
    elsif !is_rainy? && is_humid?
      weather_commentary += "It's humid today!"
    elsif is_rainy? && !is_humid?
      weather_commentary += "It may be raining, but at least it's not too humid."
    else
      weather_commentary += "It's not likely to rain and quite dry: an ideal day."
    end
  end

  def really_hot?
    @current_condition.maxtemp >= 80
  end

  def realy_cold?
    @current_condition.maxtemp <= 30
  end

  def is_rainy?
    @current_condition.precipitation >= 40
  end

  def is_humid?
    @current_condition.humidity >= 50
  end
end
