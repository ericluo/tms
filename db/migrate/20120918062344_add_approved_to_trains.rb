class AddApprovedToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :approved, :boolean
  end
end
