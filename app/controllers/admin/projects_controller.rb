class Admin::ProjectsController < ApplicationController

  layout "admin"

  #後台登入
  before_action :authenticate_user!

  #檢查權限
  before_action :check_admin
  before_action :find_project, :only => [:update, :destroy]

  def index
    @categories = Category.all
    @projects = Project.all

    if params[:project_id]
      @project = Project.find(params[:project_id])
    else
      @project = Project.new
    end
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
    @project.update(project_params)
    
    if params[:destroy_logo] == "1"
        @project.logo = nil
        @project.save
    end

    flash[:notice] = "Update Success!"
    redirect_to admin_projects_path
  end

  def destroy
    @project.destroy

    redirect_to admin_projects_path
  end



  private

  def project_params
    params.require(:project).permit(:name, :en_name,:title, :en_title, 
                                    :description,:en_description, :logo,
                                    :category_ids => []
                                  )
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def check_admin
    unless current_user.admin?
        raise ActiveRecord::RecordNotFound
    end
  end

end