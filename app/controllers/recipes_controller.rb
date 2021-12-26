class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]

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

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @recipe_attachment = @recipe.recipe_attachments.build
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
      # respond_to do |format|
    if @recipe.save
      params[:recipe_attachments]['image'].each do |a|
        @recipe_attachment = @recipe.recipe_attachments.create!(:image => a, :recipe_id => @recipe.id)
      end
      redirect_to @recipe, success: 'Статья успешно создана'
      # format.html { redirect_to @recipe, success: 'Статья успешно создана'}
      # format.json { render :show, status: :created, location: @recipe }
    else
      flash[:danger] = 'Статья не создана'
      render :new
      # format.html {render :new , status: :unprocessable_entity }
      # format.json { render json: @recipe.errors, status: :unprocessable_entity }
    end
      # end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
      # respond_to do |format|
      if @recipe.update(recipe_params)
        redirect_to @recipe, success: 'Рецепт успешно обновлена'
        # format.html { redirect_to @recipe, notice: "Рецепт обновлен!" }
        # format.json { render :show, status: :ok, location: @recipe }
      else
        flash[:danger] = 'Статья не обновлена'
        render :edit
        # format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
      # end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image, :all_tags, :category_id, recipe_attachment_attributes: [:id, :recipe_id, :image])
  end
end
