class RegressionTest < ActiveRecord::Migration
  def self.up
    add_column :regression_test_categories,:pre_condition,:text
  end

  def self.down
    remove_column :regression_test_categories,:pre_condition
  end
end
