require 'test_helper'

class AddItemsToCartTest < ActionDispatch::IntegrationTest
  test "show page price is correct" do
    node_sticker = Sticker.create(title: "Nodejs",
                                  image: "http://devstickers.com/assets/img/cat/nodejs.png",
                                  price: 6,
                                  description: "Node.js logo")

    visit sticker_path(node_sticker.id)

    within(".card-content") do
      assert page.has_content?("$6.00")
    end
  end

  test "show page price is valid with cents" do
    node_sticker = Sticker.create(title: "Nodejs",
                                  image: "http://devstickers.com/assets/img/cat/nodejs.png",
                                  price: 6.99,
                                  description: "Node.js logo")

    visit sticker_path(node_sticker.id)

    within(".card-content") do
      assert page.has_content?("$6.99")
    end
  end

  test "show page price is valid with price under a dollar" do
    node_sticker = Sticker.create(title: "Nodejs",
                                  image: "http://devstickers.com/assets/img/cat/nodejs.png",
                                  price: 0.5,
                                  description: "Node.js logo")

    visit sticker_path(node_sticker.id)

    within(".card-content") do
      assert page.has_content?("$0.50")
    end
  end
end
