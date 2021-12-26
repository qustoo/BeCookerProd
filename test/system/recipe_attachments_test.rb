require "application_system_test_case"

class RecipeAttachmentsTest < ApplicationSystemTestCase
  setup do
    @recipe_attachment = recipe_attachments(:one)
  end

  test "visiting the index" do
    visit recipe_attachments_url
    assert_selector "h1", text: "Recipe Attachments"
  end

  test "creating a Recipe attachment" do
    visit recipe_attachments_url
    click_on "New Recipe Attachment"

    fill_in "Image", with: @recipe_attachment.image
    fill_in "Recipe", with: @recipe_attachment.recipe_id
    click_on "Create Recipe attachment"

    assert_text "Recipe attachment was successfully created"
    click_on "Back"
  end

  test "updating a Recipe attachment" do
    visit recipe_attachments_url
    click_on "Edit", match: :first

    fill_in "Image", with: @recipe_attachment.image
    fill_in "Recipe", with: @recipe_attachment.recipe_id
    click_on "Update Recipe attachment"

    assert_text "Recipe attachment was successfully updated"
    click_on "Back"
  end

  test "destroying a Recipe attachment" do
    visit recipe_attachments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recipe attachment was successfully destroyed"
  end
end
