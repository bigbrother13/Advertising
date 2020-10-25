class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  def show
    @pins = Pin.where(category_id: [@category.subtree_ids]).paginate(page: params[:page], per_page: 7)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
