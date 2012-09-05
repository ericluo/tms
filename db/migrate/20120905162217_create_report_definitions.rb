class CreateReportDefinitions < ActiveRecord::Migration
  def change
    create_table :report_definitions do |t|
      t.string :name
      t.text :template

      t.timestamps
    end
  end
end
