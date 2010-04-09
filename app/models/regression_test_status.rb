class RegressionTestStatus < ActiveRecord::Base
  belongs_to :regression_test_case_id
  belongs_to :user_id
  validates_presence_of :regression_test_case_id, :user_id
  
end
