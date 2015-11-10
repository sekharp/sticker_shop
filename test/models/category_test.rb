require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "is valid with title" do
    cat = Category.create(title:"Cool Category")

    assert cat.valid?
  end

  test "is not valid without title" do
    cat = Category.create()

    assert cat.invalid?
  end
end
