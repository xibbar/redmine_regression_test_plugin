class CreateRegressionTestCases < ActiveRecord::Migration
  def self.up
    create_table :regression_test_cases do |t|
      t.column :regression_test_category_id, :integer
      t.column :user_id, :integer
      t.column :position, :integer
      t.column :step_description, :text
      t.column :expected_result, :text
      t.column :input_test_data, :text
      t.column :pre_condition, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :regression_test_cases
  end
end
