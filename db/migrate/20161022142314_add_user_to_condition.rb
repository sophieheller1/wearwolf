class AddUserToCondition < ActiveRecord::Migration[5.0]
  def change
    add_reference(:conditions, :user)
  end
end
