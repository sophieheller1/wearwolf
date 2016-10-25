class DropSuggestionsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :suggestions
  end
end
