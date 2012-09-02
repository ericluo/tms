class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :name
      t.references :category
      t.references :trainee
      t.references :registrar
      t.date :start_date
      t.date :end_date
      t.float :score
      t.string :certificate
      t.text :comment
      t.float :period
      t.string :organizer

      t.timestamps
    end
  end
end
