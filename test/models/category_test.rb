require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should able to create category" do
    category = Category.new
    category.title = 'Project'
    category.description = 'Testing'
    assert_not category.save, "Saved the create category"
  end
end
