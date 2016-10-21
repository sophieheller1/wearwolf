class RemoveLongitude < ActiveRecord::Migration[5.0]
  def up
    remove_column :locations, :longitude
  end

  def down
    add_column :locations, :longitude, :string
  end
end
