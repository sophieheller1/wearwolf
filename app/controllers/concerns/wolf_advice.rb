module WolfAdvice
  extend ActiveSupport::Concern

  def display_wolf_advice
    wolf_says = get_weather_commentary + get_wolf_advice
    if !account_for_preference.nil?
      wolf_says += account_for_preference
    end
    wolf_says
  end

  def get_wolf_advice
    wolf_advice = ""
    if really_hot_all_day?
      wolf_advice += " You should wear a T-shirt, shorts, and little else.
                    Try sandals or light sneakers on your feet."
    elsif really_hot_but_will_get_cold?
      wolf_advice += " It's scorching right now, but the temperature will descend significantly.
                      For now, you should wear a T-shirt, shorts and sandals/light sneakers.
                      The wolf thinks it would be prudent to pack a light jacket and a change
                      of pants for when the mercury drops."
    elsif really_cold?
      wolf_advice += " Wow, it's time to bundle up! You should wear a sweater and pants
                    under a winter coat. Insulating boots are a must.
                    Add a scarf, gloves, and hat for optimal comfort."
    elsif between_65_and_80?
      wolf_advice += " You should wear a T-shirt and shorts.
                      Bring a light jacket or sweater since it will be cool in the shade.
                      Try sandals or light sneakers on your feet."
    elsif between_40_and_65?
      wolf_advice += " Since it's starting to get a bit colder out there, you should wear a T-shirt and jeans,
                      with a sweater on top. Add a mid-weight jacket or down vest for extra insulation.
                      It's definitely a good idea to wear boots to keep your feet warm."
    elsif between_20_and_40?
      wolf_advice += " Since it's pretty cold today, prepare for it with a T-shirt and jeans, covered by a sweater.
                      Add a mid-weight jacket or down coat, depending on comfort. You'll probably want gloves and a
                      good pair of boots."
    elsif really_cold?
      wolf_advice += " I pity the wolf without fur. Bundle up with an under layer of a T-shirt and jeans/flannel leggings,
                      1-2 sweaters, and a puffy down coat. You'll also want a hat, gloves, scarf, and heavy boots."
    end
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

  def account_for_preference
    preference_add_on = ""
    if you_run_cold?
      preference_add_on += " Since you run cold, the wolf thinks you should bring an extra layer."
    elsif you_run_cold?
      preference_add_on =+ " Since you run hot, the wolf advises you to leave that extra layer at home."
    end
  end

  def is_rainy?
    @current_condition.precipitation >= 40
  end

  def is_humid?
    @current_condition.humidity >= 50
  end

  def really_hot_all_day?
    @current_condition.maxtemp >= 80 && @current_condition.mintemp >= 65
  end

  def really_hot_but_will_get_cold?
    @current_condition.maxtemp >= 80 && @current_condition.mintemp < 65
  end

  def between_65_and_80?
    @current_condition.maxtemp >= 65 && @current_condition.maxtemp < 80
  end

  def between_40_and_65?
    @current_condition.maxtemp >= 40 && @current_condition.maxtemp <= 65
  end

  def between_20_and_40?
    @current_condition.maxtemp > 20 && @current_condition.maxtemp < 40
  end

  def really_cold?
    @current_condition.maxtemp <= 20
  end

  def you_run_cold?
    current_user.preference == 'cold'
  end

  def you_run_hot?
    current_user.preference == 'hot'
  end
end
