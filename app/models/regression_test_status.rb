class RegressionTestStatus < ActiveRecord::Base
  belongs_to :regression_test_case
  belongs_to :regression_test_iteration
  belongs_to :user
  validates_presence_of :regression_test_case_id, :regression_test_iteration_id, :user_id,:result
  
end
