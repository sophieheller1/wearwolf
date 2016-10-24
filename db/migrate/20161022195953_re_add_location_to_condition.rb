class ReAddLocationToCondition < ActiveRecord::Migration[5.0]
  def change
    add_reference(:conditions, :location)
  end
end
