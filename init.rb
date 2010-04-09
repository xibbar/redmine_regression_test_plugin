require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare :redmine_regression_test do
  require_dependency 'project'
  # Guards against including the module multiple time (like in tests)
  require 'regression_test_category_project_patch'
  require 'regression_test_iteration_patch'
  # and registering multiple callbacks
  unless Project.included_modules.include? RegressionTestCategoryProjectPatch
    Project.send(:include, RegressionTestCategoryProjectPatch)
  end
  unless Project.included_modules.include? RegressionTestIterationPatch
    Project.send(:include, RegressionTestIterationPatch)
  end
end


Redmine::Plugin.register :redmine_regression_test do
  name 'Redmine Regression Test plugin'
  author 'Takeyuki FUJIOKA'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  menu :project_menu, :regression_tests, {:controller=>'regression_test_categories',:action=>'index'}, :caption=>:regression_test,:after=>:last,:param=>"project" do
  end
  project_module :regression_test do
    permission :regression_test, {:regression_test_categories=>[:index,
      :sort_case,:update_sort_case,:sort_category,:update_sort_category,
      :show_category,:new_category,:create_category,:edit_category,:update_category,:destroy_category,
      :new_case,:create_case,:edit_case,:update_case,:destroy_case]}
  end
end
