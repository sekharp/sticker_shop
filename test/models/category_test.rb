require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  should have_many(:stickers)

  test "is valid with title" do
    cat = Category.create(title: "Cool Category")

    assert cat.valid?
  end

  test "is not valid without title" do
    cat = Category.create()

    assert cat.invalid?
  end

  test "its title must be unique" do
    cat = Category.create(title: "Cool Category")
    second_cat = Category.create(title: "Cool Category")

    refute second_cat.valid?
  end

  test "returns parameterized slug of title" do
    cat = Category.create(title: "Cool Category")

    assert_equal "cool-category", cat.slug
  end
end
