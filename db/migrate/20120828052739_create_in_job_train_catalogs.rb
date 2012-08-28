class CreateInJobTrainCatalogs < ActiveRecord::Migration
  def change
    create_table :in_job_train_catalogs do |t|
      t.string :title
      t.string :level
      t.integer :score
    end
  end
end
