require 'test_helper'

class AddItemsToCartTest < ActionDispatch::IntegrationTest
  test "displays added item to cart message and cart item quantity" do
    Sticker.create(title: "Node.js",
                   image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                   price: 6)

    visit root_path

    assert page.has_content?("Cart: 0")

    click_button "Add to Cart"

    assert page.has_content?("You now have 1 Sticker.")
    assert page.has_content?("Cart: 1")
  end
end
