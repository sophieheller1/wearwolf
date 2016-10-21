class RemoveLocationFromCondition < ActiveRecord::Migration[5.0]
  def up
    remove_column :conditions, :location_id
  end

  def down
    add_column :conditions, :location_id, :integer
  end
end
