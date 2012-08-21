class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.date :start_date
      t.date :end_date
      t.float :duration
      t.string :organizer
      t.integer :category_id
      t.integer :trainee_id

      t.timestamps
    end
  end
end
