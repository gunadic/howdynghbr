class CategoriesController < InheritedResources::Base

  def index
    @categories = Category.find(:all)
  end
end
