class Admin::ProjectsController < ApplicationController

  def index
    @projects = Project.all
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Create Success!"
      redirect_to admin_projects_path
    else
      flash[:alert] = "Create fail!"
      render "index"
    end
  end

  def update
    if params[:destroy_logo] == "1"
        @project.logo = nil
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :en_name,:title, :en_title, 
                                    :description,:en_description, :logo
                                  )
  end

end