class RegressionTestsController < ApplicationController
  unloadable
  before_filter :find_project,:authorize
  before_filter :find_category,:only=>[:new_case,:create_case,:edit_case,:update_case,:destroy_case]

  def index
#    @categories=RegressionTestCategory.all(:conditions=>["project_id=?",@project.id],:order=>"position")
    @categories=@project.regression_test_categories
  end
  def new_category
    @category=RegressionTestCategory.new
  end
  def create_category
    @category=RegressionTestCategory.new(params[:regression_test_category])
    @category.project=@project
    if @category.save
      flash[:notice]="Created."
      redirect_to :action=>"index"
    else
      render :action=>"new_category"
    end
  end
  def edit_category
    @category=RegressionTestCategory.find(params[:id])
  end
  def update_category
    @category=RegressionTestCategory.find(params[:id])
    if @category.update_attributes(params[:regression_test_category])
      flash[:notice]="Updated."
      redirect_to :action=>"index"
    else
      render :action=>"edit_category"
    end
  end
  def destroy_category
    @category=RegressionTestCategory.find(params[:id])
    if @category.destroy
      @category.regression_test_cases.each_with_index do |test_case,n|
        test_case.update_attribute(:position,n+1)
      end
      flash[:notice]="Destroy Successful."
      redirect_to :action=>"index"
    else
      flash[:notice]="Destroy Failed."
      redirect_to :action=>"index"
    end
  end
  def show_category
    @category=RegressionTestCategory.find(params[:id])
  end
  def sort_case
    @category=RegressionTestCategory.find(params[:id])
  end
  def update_sort_case
    @category=RegressionTestCategory.find(params[:id])
    params[:sortable_list].each_with_index do |test_case_id,n|
      RegressionTestCase.find(test_case_id).update_attribute(:position,(n+1))
    end
    render :update do |page|
      page.visual_effect(:highlight,"sortable_list")
    end
    
  end
  def sort_category
    @categories=RegressionTestCategory.all(:conditions=>["project_id=?",@project.id],:order=>"position")
  end
  def update_sort_category
    params[:sortable_list].each_with_index do |category_id,n|
      RegressionTestCategory.find(category_id).update_attribute(:position,(n+1))
    end
    render :update do |page|
      page.visual_effect(:highlight,"sortable_list")
    end
    
  end
  def new_case
    @test_case=RegressionTestCase.new
  end
  def create_case
    @test_case=RegressionTestCase.new(params[:regression_test_case])
    @test_case.user_id=session[:user_id]
    @test_case.regression_test_category=@category
    if @test_case.save
      flash[:notice]="Created."
      redirect_to :action=>"show_category",:id=>@category
    else
      render :action=>"new_case"
    end
  end
  def edit_case
    @test_case=RegressionTestCase.find(params[:id])
  end
  def update_case
    @test_case=RegressionTestCase.find(params[:id])
    @test_case.user_id=session[:user_id]
    if @test_case.update_attributes(params[:regression_test_case])
      flash[:notice]="Updated."
      redirect_to :action=>"show_category",:id=>@category
    else
      render :action=>"edit_case"
    end
  end
  def destroy_case
    @test_case=RegressionTestCase.find(params[:id])
    if @test_case.destroy
      flash[:notice]="Destroy Successful."
      redirect_to :action=>"show_category",:id=>@category
    else
      flash[:notice]="Destroy Failed."
      redirect_to :action=>"show_category",:id=>@category
    end
  end
  private
  def find_project
    @project=Project.first(:conditions=>["identifier=?",params[:project]])
  end
  def find_category
    @category=RegressionTestCategory.find(params[:category_id])
  end
  def default_url_options(options = {})
    return unless request
    result={}
    if params[:project]
      result[:project] = params[:project]
    end
    return result

  end
  
end
