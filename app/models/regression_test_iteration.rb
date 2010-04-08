class RegressionTestIteration < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :name
  acts_as_list :scope=>:project_id
end
