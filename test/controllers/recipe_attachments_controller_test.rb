require "test_helper"

class RecipeAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_attachment = recipe_attachments(:one)
  end

  test "should get index" do
    get recipe_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_attachment_url
    assert_response :success
  end

  test "should create recipe_attachment" do
    assert_difference('RecipeAttachment.count') do
      post recipe_attachments_url, params: { recipe_attachment: { image: @recipe_attachment.image, recipe_id: @recipe_attachment.recipe_id } }
    end

    assert_redirected_to recipe_attachment_url(RecipeAttachment.last)
  end

  test "should show recipe_attachment" do
    get recipe_attachment_url(@recipe_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_attachment_url(@recipe_attachment)
    assert_response :success
  end

  test "should update recipe_attachment" do
    patch recipe_attachment_url(@recipe_attachment), params: { recipe_attachment: { image: @recipe_attachment.image, recipe_id: @recipe_attachment.recipe_id } }
    assert_redirected_to recipe_attachment_url(@recipe_attachment)
  end

  test "should destroy recipe_attachment" do
    assert_difference('RecipeAttachment.count', -1) do
      delete recipe_attachment_url(@recipe_attachment)
    end

    assert_redirected_to recipe_attachments_url
  end
end
