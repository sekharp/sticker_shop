require 'test_helper'

class RemoveItemsFromCartTest < ActionDispatch::IntegrationTest
  test "displays removed sticker from cart message and cart sticker quantity on cart page" do
    Sticker.create(title: "Nodejs",
                   image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                   price: 6,
                   description: "Node.js logo")

    visit root_path

    click_button "Add to Cart"
    click_button "Add to Cart"

    click_link "Cart"

    within("#cart-contents") do
      assert page.has_content?("Nodejs")
    end

    click_link "Remove"

    within("#nav-bar") do
      assert page.has_content?("Successfully removed Nodejs sticker from your cart.")
    end
  end

  test "cart displays sticker information for removing" do
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
      assert page.has_content?("Total Price: $14")
    end

  end
end
