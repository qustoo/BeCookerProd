class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  def show
    @recipes = Recipe.where(category_id: [@category.subtree_ids]).paginate(page: params[:page], per_page: 1)
  end

  # Приватная секция
  private
  def set_category
    @category = Category.find(params[:id])
  end
end
