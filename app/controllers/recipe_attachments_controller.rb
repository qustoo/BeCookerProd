class RecipeAttachmentsController < ApplicationController
  before_action :set_recipe_attachment, only: %i[ show edit update destroy ]

  # GET /recipe_attachments or /recipe_attachments.json
  def index
    @recipe_attachments = RecipeAttachment.all
  end

  # GET /recipe_attachments/1 or /recipe_attachments/1.json
  def show
  end

  # GET /recipe_attachments/new
  def new
    @recipe_attachment = RecipeAttachment.new
  end

  # GET /recipe_attachments/1/edit
  def edit
  end

  # POST /recipe_attachments or /recipe_attachments.json
  def create
    @recipe_attachment = RecipeAttachment.new(recipe_attachment_params)

    respond_to do |format|
      if @recipe_attachment.save
        format.html { redirect_to @recipe_attachment, notice: "Recipe attachment was successfully created." }
        format.json { render :show, status: :created, location: @recipe_attachment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_attachments/1 or /recipe_attachments/1.json
  def update
    respond_to do |format|
      if @recipe_attachment.update(recipe_attachment_params)
        format.html { redirect_to @recipe_attachment, notice: "Recipe attachment was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe_attachment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_attachments/1 or /recipe_attachments/1.json
  def destroy
    @recipe_attachment.destroy
    respond_to do |format|
      format.html { redirect_to recipe_attachments_url, notice: "Recipe attachment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_attachment
      @recipe_attachment = RecipeAttachment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_attachment_params
      params.require(:recipe_attachment).permit(:recipe_id, :image)
    end

  def update
    respond_to do |format|
      if @recipe_attachment.update(recipe_attachment_params)
        format.html { redirect_to @recipe_attachment.post, notice: 'Post attachment was successfully updated.' }
      end
    end
  end
end
