class AddNameAndPositionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :position_id, :integer
  end
end
