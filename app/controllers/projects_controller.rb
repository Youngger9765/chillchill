class ProjectsController < ApplicationController

  def main
    @categories = Category.all
  end

  def index
    if params[:category]
      @category = Category.find(params[:category])
      @projects = @category.projects
    end
  end



end
