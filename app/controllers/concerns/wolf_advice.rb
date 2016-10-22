module WolfAdvice
  extend ActiveSupport::Concern

  def display_wolf_advice
    wolf_says = get_weather_commentary + get_wolf_advice
  end

  def get_wolf_advice
    wolf_advice = ""
    if really_hot?
      wolf_advice += "It's scorching! You should wear a T-shirt, shorts, and little else.
                    Try sandals or light sneakers on your feet."
    elsif really_cold?
      wolf_advice += "It's time to bundle up! You should wear a sweater and pants
                    under a winter coat. Insulating boots are a must.
                    Add a scarf, gloves, and hat for optimal comfort."
    end
    wolf_advice
  end

  def get_weather_commentary
    weather_commentary = ""
    if is_rainy? && is_humid?
      weather_commentary += "It's raining and humid. What a gross day! "
    elsif !is_rainy? && is_humid?
      weather_commentary += "It's humid today!"
    elsif is_rainy? && !is_humid?
      weather_commentary += "It may be raining, but at least it's not too humid. "
    else
      weather_commentary += "It's not likely to rain and quite dry: an ideal day. "
    end
  end

  def really_hot?
    @current_condition.maxtemp >= 80
  end

  def really_cold?
    @current_condition.maxtemp <= 30
  end

  def is_rainy?
    @current_condition.precipitation >= 40
  end

  def is_humid?
    @current_condition.humidity >= 50
  end
end
