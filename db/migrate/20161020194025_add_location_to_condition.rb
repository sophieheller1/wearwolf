class AddLocationToCondition < ActiveRecord::Migration[5.0]
  def change
    add_reference(:conditions, :location, null:false)
  end
end
