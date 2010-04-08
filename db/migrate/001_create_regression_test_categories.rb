class CreateRegressionTestCategories < ActiveRecord::Migration
  def self.up
    create_table :regression_test_categories do |t|
      t.column :name, :string
      t.column :comment, :text
      t.column :project_id, :integer
      t.column :position,:integer
      t.timestamps
    end
  end

  def self.down
    drop_table :regression_test_categories
  end
end
