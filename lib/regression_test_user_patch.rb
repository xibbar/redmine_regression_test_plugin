require_dependency 'user'
 
# Patches Redmine's Issues dynamically. Adds a relationship
# Issue +has_many+ to ArchDecisionIssue
# Copied from dvandersluis' redmine_resources plugin: 
# http://github.com/dvandersluis/redmine_resources/blob/master/lib/resources_issue_patch.rb
module RegressionTestUserPatch
  def self.included(base) # :nodoc:
    # Same as typing in the class
    base.class_eval do
      has_many :regression_test_statuses,:class_name => 'RegressionTestStatus', :foreign_key => 'user_id', :dependent => :nullify
    end
  end
end
 
User.send(:include, RegressionTestUserPatch)
