class Api::V1::ConditionsController < ActionController::Base
  include WolfAdvice

  def create
    @current_condition = Condition.new(condition_params)
    @current_condition.user = current_user
    @current_condition.save
    respond_to do |format|
      format.json do
        render json: { wolfAdvice: display_wolf_advice }
      end
    end
  end

  private

  def condition_params
    params.permit(:maxtemp, :mintemp, :precipitation, :humidity, :description, :zip)
  end
end
