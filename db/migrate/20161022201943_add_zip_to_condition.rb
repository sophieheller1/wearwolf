class AddZipToCondition < ActiveRecord::Migration[5.0]
  def up
    add_column :conditions, :zip, :string
  end

  def down
    add_column :conditions, :zip
  end
end
