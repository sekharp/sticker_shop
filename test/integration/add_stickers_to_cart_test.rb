require 'test_helper'

class AddItemsToCartTest < ActionDispatch::IntegrationTest
  test "displays added item to cart message and cart item quantity" do
    Sticker.create(title: "Node.js",
                   image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                   price: 6,
                   description: "Node.js logo")

    visit root_path
    within("#nav-bar") do
      assert page.has_content?("Cart: 0")
    end

    click_button "Add to Cart"

    within("#nav-bar") do
      assert page.has_content?("Sticker added to cart")
      assert page.has_content?("Cart: 1")
    end
  end

  test "cart displays sticker information" do
    Sticker.create(title: "Nodejs",
                   image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                   price: 6,
                   description: "Node.js logo")
    Sticker.create(title: "Reactjs",
                   image_url: "http://devstickers.com/assets/img/cat/react-js.png",
                   price: 8,
                   description: "React.js logo")

    visit root_path
    within "#Nodejs-button" do
      click_button "Add to Cart"
    end

    within "#Reactjs-button" do
      click_button "Add to Cart"
    end

    click_link "Cart"

    within("#cart-contents") do
      assert page.has_content?("Nodejs")
      assert page.has_content?("6")
      assert page.has_content?("Node.js logo")
      assert page.has_css?("img[src*='http://devstickers.com/assets/img/cat/nodejs.png']")
      assert page.has_content?("Subtotal: $14")
    end

  end
end
