class CreateRegressionTestStatuses < ActiveRecord::Migration
  def self.up
    create_table :regression_test_statuses do |t|
      t.integer :regression_test_case_id
      t.integer :user_id
      t.string  :result
      t.text    :remark
      t.time_stamps
    end
  end

  def self.down
    drop_table :regression_test_statuses
  end
end
