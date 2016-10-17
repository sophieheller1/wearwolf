class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :city, null:false
      t.string :state, null:false
      t.string :zip, null:false
      t.string :country, null:false
      t.string :latitude, null:false
      t.string :longitude, null:false
    end
  end
end
