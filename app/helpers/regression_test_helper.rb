module RegressionTestHelper
  def breadcrumbs_link
    str=@breadcrumbs.map{|breadcrumb|
        if @breadcrumbs.last==breadcrumb
          h(breadcrumb[:name])
        else
          link_to(h(breadcrumb[:name]),url_for(breadcrumb[:url]))
        end
    }.join(" &gt;&gt; ")
    str
  end 
end
