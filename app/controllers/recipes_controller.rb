class RecipesController < ApplicationController
  before_action :set_recipe, only: :show
  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 1)
    respond_to do |format|
      format.html
      format.json { render json: @locations }
    end
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe_attachments = @recipe.recipe_attachments.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
