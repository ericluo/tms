class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.date :start_date
      t.date :end_date
      t.string :title
      t.text :content

      t.references :report_definition
      t.timestamps
    end
  end
end
