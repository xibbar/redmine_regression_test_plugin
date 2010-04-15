class RegressionTestIteration < ActiveRecord::Base
  has_many :regression_test_statuses,:dependent=>:destroy
  belongs_to :project
  validates_presence_of :name,:project_id
  acts_as_list :scope=>:project_id
end
