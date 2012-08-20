class AddRoleAndRankToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
    add_column :users, :rank, :integer
  end
end
