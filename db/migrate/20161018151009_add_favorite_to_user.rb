class AddFavoriteToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :favorite, :string
  end
end
