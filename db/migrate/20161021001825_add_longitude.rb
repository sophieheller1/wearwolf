class AddLongitude < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :longitude, :string
  end
end
