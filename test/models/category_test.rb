require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "no unnamed categories" do
    cat = Category.new
    assert_not cat.save, "saved category with no title"
  end
end
