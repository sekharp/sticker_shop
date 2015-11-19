require 'test_helper'

class RemoveItemsFromCartTest < ActionDispatch::IntegrationTest
  def setup
    @node_sticker = Sticker.create(title: "Nodejs",
                                   image: "http://devstickers.com/assets/img/cat/nodejs.png",
                                   price: 6,
                                   description: "Node.js logo")
  end

  test "displays removed sticker from cart message and cart sticker quantity on cart page" do
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
      assert page.has_content?("6")
      assert page.has_content?("Node.js logo")
      assert page.has_css?("img[src*='#{@node_sticker.image.url}']")
      assert page.has_content?("Total Price: $14")
    end

  end
end
