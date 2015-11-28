class ProjectsController < ApplicationController

  def index
    @categories = Category.all

  end


end
