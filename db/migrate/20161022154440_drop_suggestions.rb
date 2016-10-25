class DropSuggestions < ActiveRecord::Migration[5.0]
  def up
   drop_table :suggestions
 end

 def down
   raise ActiveRecord::IrreversibleMigration
 end
end
