class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.date :start_date
      t.date :end_date
      t.string :category
      t.text :content

      t.timestamps
    end
  end
end
