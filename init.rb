require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare :redmine_regression_test do
  # Guards against including the module multiple time (like in tests)
  require 'regression_test_project_patch'
  require 'regression_test_user_patch'
  # and registering multiple callbacks
  unless Project.included_modules.include? RegressionTestProjectPatch
    Project.send(:include, RegressionTestProjectPatch)
  end
  unless User.included_modules.include? RegressionTestUserPatch
    User.send(:include, RegressionTestUserPatch)
  end
end


Redmine::Plugin.register :redmine_regression_test do
  name 'Redmine Regression Test plugin'
  author 'Takeyuki FUJIOKA'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  menu :project_menu, :regression_test, 
    {:controller=>'regression_test',:action=>'index'},
    :caption=>:regression_test,
    :after=>:last,:param=>"project"
  project_module :regression_test do
    permission :regression_test, {
      :regression_test=>[:index,
        :sort_case,:update_sort_case,:sort_category,:update_sort_category,
        :sort_iteration,:update_sort_iteration,
        :category_list, :show_category,:new_category,:create_category,
        :edit_category,:update_category,:destroy_category,
        :iteration_list, :show_iteration,:new_iteration,:create_iteration,
        :edit_iteration,:update_iteration,:destroy_iteration,
        :new_case,:create_case,:edit_case,:update_case,:destroy_case]}
  end
end
