require_dependency 'project'
 
# Patches Redmine's Issues dynamically. Adds a relationship
# Issue +has_many+ to ArchDecisionIssue
# Copied from dvandersluis' redmine_resources plugin: 
# http://github.com/dvandersluis/redmine_resources/blob/master/lib/resources_issue_patch.rb
module RegressionTestProjectPatch
  def self.included(base) # :nodoc:
    # Same as typing in the class
    base.class_eval do
      has_many :regression_test_categories,:class_name => 'RegressionTestCategory', :foreign_key => 'project_id', :dependent => :destroy, :order => "position"
      has_many :regression_test_iterations,:class_name => 'RegressionTestIteration', :foreign_key => 'project_id', :dependent => :destroy, :order => "position"
    end
  end
end
 
Project.send(:include, RegressionTestProjectPatch)
