class AddRoleAndPositionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
    add_column :users, :position, :integer
  end
end
