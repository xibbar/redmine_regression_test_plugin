class RegressionTestCase < ActiveRecord::Base
  belongs_to :regression_test_category
  belongs_to :user
  validates_presence_of :regression_test_category_id,:step_description
  acts_as_list :scope=>:regression_test_category
  has_many :regression_test_statuses,:dependent=>:destroy
  def status(iteration)
    status=RegressionTestStatus.find(:first,
      :conditions=>["regression_test_case_id=? AND regression_test_iteration_id=?",self.id,iteration.id])
    status
  end
end
