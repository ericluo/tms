class CreateTrainCategories < ActiveRecord::Migration
  def change
    create_table :train_categories do |t|
      t.string :name
      t.float :weight

      t.timestamps
    end
  end
end
