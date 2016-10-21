class RemoveCoordinates < ActiveRecord::Migration[5.0]
  def up
    remove_column :locations, :latitude
  end

  def down
    add_column :locations, :latitude, :string
  end
end
