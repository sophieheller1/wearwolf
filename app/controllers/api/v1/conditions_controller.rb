class Api::V1::ConditionsController < ActionController::Base

  def create
    @condition = Condition.new(condition_params)



  end

  private

  def condition_params
    params.require(:condition).permit()
  end
end
