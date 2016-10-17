class CreateGarments < ActiveRecord::Migration[5.0]
  def change
    create_table :garments do |t|
      t.string :name, null:false
      t.boolean :is_male
      t.boolean :is_female
    end
  end
end
