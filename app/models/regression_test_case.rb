class RegressionTestCase < ActiveRecord::Base
  belongs_to :regression_test_category
  belongs_to :user
  validates_presence_of :regression_test_category_id,:step_description,:expected_result
  acts_as_list :scope=>:regression_test_category
end
