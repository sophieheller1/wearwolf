class DropGarments < ActiveRecord::Migration[5.0]
  def up
   drop_table :garments
 end

 def down
   raise ActiveRecord::IrreversibleMigration
 end
end
