class AddNameAndPositionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :position, :integer
  end
end
