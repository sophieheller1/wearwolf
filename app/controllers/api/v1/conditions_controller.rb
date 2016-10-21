class Api::V1::ConditionsController < ActionController::Base

  def create
    @condition = Condition.new(condition_params)
    @condition.save
  end

  private

  def condition_params
    params.permit(:maxtemp, :mintemp, :precipitation, :humidity, :description)
  end
end
