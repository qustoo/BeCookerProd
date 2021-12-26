require "test_helper"

class AdminCategoriesTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end
end