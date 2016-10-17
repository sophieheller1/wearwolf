class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.integer :maxtemp, null:false
      t.integer :mintemp, null:false
      t.integer :precipitation, null:false
      t.integer :humidity, null:false
      t.string :description
    end
  end
end
