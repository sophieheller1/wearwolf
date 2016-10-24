module WolfAdvice
  extend ActiveSupport::Concern

  def display_wolf_advice
    wolf_says = get_weather_commentary + get_wolf_advice
  end

  def get_wolf_advice
    wolf_advice = ""
    if really_hot_all_day?
      wolf_advice += "It's scorching! You should wear a T-shirt, shorts, and little else.
                    Try sandals or light sneakers on your feet."
    elsif really_hot_but_will_get_cold?
      wolf_advice += "It's scorching right now, but the temperature will descend significantly.
                      For now, you should wear a T-shirt, shorts and sandals/light sneakers.
                      The wolf thinks it would be prudent to pack a light jacket and a change
                      of pants for when the mercury drops."
    elsif really_cold?
      wolf_advice += "It's time to bundle up! You should wear a sweater and pants
                    under a winter coat. Insulating boots are a must.
                    Add a scarf, gloves, and hat for optimal comfort."
    elsif between_65_and_80?
      wolf_advice += "It's a warm day in the neighborhood. You should wear a T-shirt and shorts.
                      Bring a light jacket or sweater since it will be cool in the shade.
                      Try sandals or light sneakers on your feet."
    # elsif between_40_and_65?
    #   wolf_advice +=
    #
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

  def is_rainy?
    @current_condition.precipitation >= 40
  end

  def is_humid?
    @current_condition.humidity >= 50
  end

  def really_hot_all_day?
    @current_condition.maxtemp >= 80 && current_condition.mintemp >= 65
  end

  def really_hot_but_will_get_cold?
    @current_condition.maxtemp >= 80 && current_condition.mintemp < 65
  end

  def between_65_and_80?
    @current_condition.maxtemp >= 65 && @current_condition.maxtemp < 80
  end

  def between_40_and_65?
    @current_condition.maxtemp >= 40 && @current_condition.maxtemp < 60
  end

  def between_20_and_40?
    @current_condition.maxtemp > 20 && @current_condition.maxtemp < 40
  end

  def really_cold?
    @current_condition.maxtemp <= 20
  end

  # def you_run_cold?
  #
  # end

  # def you_run_hot?
  #
  # end
end
