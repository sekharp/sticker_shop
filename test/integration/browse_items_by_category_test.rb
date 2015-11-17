require "test_helper"

class VisitorViewsItemsByCategoryTest < ActionDispatch::IntegrationTest
  test "visitor sees stickers in correct category" do
    company_category = Category.create(title: "Companies")
    product_category = Category.create(title: "Products")

    c_sticker = company_category.stickers.create(title: "Node.js",
                                                 image: "http://devstickers.com/assets/img/cat/nodejs.png",
                                                 description: "Node.js logo",
                                                 price: 2)

    p_sticker = product_category.stickers.create(title: "React.js",
                                                 image: "http://devstickers.com/assets/img/cat/react-js.png",
                                                 description: "React.js logo",
                                                 price: 3)

    visit categories_path

    click_link "Companies"

    assert_current_path category_path(company_category)
    within "#stickers" do
      assert page.has_css?("img[src*='#{c_sticker.image.url}']")
      assert page.has_content?("Node.js logo")
      refute page.has_content?("React.js logo")
    end

    visit categories_path
    click_link "Products"

    assert_current_path category_path(product_category)
    within "#stickers" do
      assert page.has_content? "React.js logo"
      refute page.has_content? "Node.js logo"
      assert page.has_css?("img[src*='#{p_sticker.image.url}']")
    end
  end
end
