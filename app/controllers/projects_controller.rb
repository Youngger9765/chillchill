class ProjectsController < ApplicationController

  def main
    @categories = Category.all
  end

  def index
    @projects = Project.all
  end



end
