class AddTimestampsToConditions < ActiveRecord::Migration[5.0]
  def change
    add_timestamps :conditions
    add_timestamps :locations
  end
end
