require 'test_helper'

class AddItemsToCartTest < ActionDispatch::IntegrationTest
  test "displays added item to cart message and cart item quantity" do
    Sticker.create(title: "Nodejs",
                   image: "http://devstickers.com/assets/img/cat/nodejs.png",
                   price: 6,
                   description: "Node.js logo")

    visit root_path

    within("#primary-navigation") do
      assert page.has_content?("0")
    end

    click_button "Add to Cart"

    within("#nav-bar") do
      assert page.has_content?("Successfully added Nodejs sticker to your cart.")
    end

    within("#primary-navigation") do
      assert page.has_content?("1")
    end
  end

  test "cart displays sticker information" do
    node_sticker = Sticker.create(title: "Nodejs",
                                  image: "http://devstickers.com/assets/img/cat/nodejs.png",
                                  price: 5,
                                  description: "Node.js logo")

    Sticker.create(title: "Reactjs",
                   image: "http://devstickers.com/assets/img/cat/react-js.png",
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
      assert page.has_content?("5")
      assert page.has_content?("Node.js logo")
      assert page.has_css?("img[src*='#{node_sticker.image.url}']")
      assert page.has_content?("Total Price: $13")
    end 

  end
end
