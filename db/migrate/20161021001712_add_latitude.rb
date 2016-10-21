class AddLatitude < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :latitude, :string
  end
end
