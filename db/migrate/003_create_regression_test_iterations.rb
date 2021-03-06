class CreateRegressionTestIterations < ActiveRecord::Migration
  def self.up
    create_table :regression_test_iterations do |t|
      t.column :project_id,:integer
      t.column :position,:integer
      t.column :name,:string
      t.timestamps
    end
  end

  def self.down
    drop_table :regression_test_iterations
  end
end
