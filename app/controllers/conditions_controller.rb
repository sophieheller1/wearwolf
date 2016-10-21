class ConditionsController < ApplicationController

  def create
    @user = current_user
    @location = Location.find(params[:id])
    condition = Condition.find_by(location: location.id)

    if condition.present?
      @condition = Condition.create(
        location: location,
        maxtemp: high,
        mintemp: low,
        precipitation: precipitation,
        humidity: humidity,
        description: summary
      )
    end

    respond_to do |format|
      if @condition.save
        format.json { render :json => @condition }
      else
        format.json { render :json => @condition.errors }
      end
    end
  end
end
