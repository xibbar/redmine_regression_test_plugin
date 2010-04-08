class RegressionTestCategory < ActiveRecord::Base
  belongs_to :project
  has_many :regression_test_cases, :dependent=>:destroy, :order=>"position"
  validates_presence_of :name,:project_id
end
