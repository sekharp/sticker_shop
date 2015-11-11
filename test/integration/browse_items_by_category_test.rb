require "test_helper"

class VisitorViewsItemsByCategoryTest < ActionDispatch::IntegrationTest
  test "visitor sees stickers in correct category" do
    company_category = Category.create(title: "Companies")
    product_category = Category.create(title: "Products")

    company_category.stickers.create(title: "Node.js",
                                     image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                                     price: 2)

    product_category.stickers.create(title: "React.js",
                                     image_url: "http://devstickers.com/assets/img/cat/react-js.png",
                                     price: 3)

    visit categories_path

    click_link "Companies"

    assert_current_path category_path(company_category)
    within "#stickers" do
      refute page.has_content? "React.js"
      assert page.has_content? "Node.js"
      assert page.has_css?("img[src*='http://devstickers.com/assets/img/cat/nodejs.png']")
      assert page.has_content? "2"
    end

    visit categories_path
    click_link "Products"

    assert_current_path category_path(product_category)
    within "#stickers" do
      refute page.has_content? "Node.js"
      assert page.has_content? "React.js"
      assert page.has_css?("img[src*='http://devstickers.com/assets/img/cat/react-js.png']")
      assert page.has_content? "3"
    end
  end
end
