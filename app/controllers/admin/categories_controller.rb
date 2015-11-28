class Admin::CategoriesController < ApplicationController

  layout "admin"

  before_action :find_category, :only => [:update, :destroy]

  def index
    @categories = Category.all

    if params[:category_id]
      @category = Category.find( params[:category_id] )
    else
      @category = Category.new
    end
  end

  def create
    @categories = Category.all
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Create Success!"
      redirect_to admin_categories_path
    else
      flash[:alert] = "Create fail!"
      render "index"
    end
  end

  def destroy
    @category.destroy

    redirect_to admin_categories_path
  end

  def update
    @category.update(category_params)
    flash[:notice] = "Update Success!"
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :en_name)
  end

  def find_category
    @category = Category.find(params[:id])
  end

end
