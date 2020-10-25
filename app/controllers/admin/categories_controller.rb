class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:edit, :update, :destroy]
  before_action :check_admin

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @categories = Category.all.order(:name)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, success: 'Категория успешно создана'
    else
      @categories = Category.all.order(:name)
      flash[:danger] = 'Категория не создана'
      render :new
    end
  end

  def edit
    @categories = Category.where("id != #{@category.id}").order(:name)
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to admin_categories_path, success: 'Категория успешно обновлена'
    else
      @categories = Category.where("id != #{@category.id}").order(:name)
      flash[:danger] = 'Категория не обновлена'
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, success: 'Категория успешно удалена'
  end

  protected

  def check_admin
    redirect_to root_path, alert: "You do not have permission to access this page" unless current_user.admin?
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
