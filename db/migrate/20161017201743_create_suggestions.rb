class CreateSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.belongs_to :garment
      t.belongs_to :condition
    end
  end
end
