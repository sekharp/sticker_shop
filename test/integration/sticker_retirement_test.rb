class StickerRetirementTest < ActionDispatch::IntegrationTest
  test "user cart shows retired stickers" do
    User.create(username: "Jason",
                password: "password")

    Sticker.create(title: "Nodejs",
                   image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                   price: 6,
                   description: "Node.js logo",
                   retired?: true)

    Sticker.create(title: "Reactjs",
                   image_url: "http://devstickers.com/assets/img/cat/react-js.png",
                   description: "React.js logo",
                   price: 3,
                   retired?: false)

    visit root_path
    within("#Nodejs-button") do
      click_button "Add to Cart"
    end
    within("#Reactjs-button") do
      click_button "Add to Cart"
    end
    click_link "Cart"

    within("#Nodejs-button") do
      assert page.has_content?("No longer available")
    end
    within("#Reactjs-button") do
      refute page.has_content?("No longer available")
    end
  end

  test "user order page shows retired stickers" do
    Sticker.create(title: "Nodejs",
                   image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                   price: 6,
                   description: "Node.js logo",
                   retired?: true)

    User.create(username: "Sekhar",
                       password: "password")

    visit login_path

    fill_in "Username", with: "Sekhar"
    fill_in "Password", with: "password"
    click_button "Login"

    visit root_path
    click_button "Add to Cart"
    click_button "Add to Cart"

    click_link "Cart"
    click_button "Checkout"

    assert page.has_content?("Past Orders")

    within("#past-orders") do
      assert page.has_content?("Ordered")
      assert page.has_content?("Order includes item(s) no longer available.")
    end
  end

  test "retired stickers have show pages" do
    sticker = Sticker.create(title: "Nodejs",
                             image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                             price: 6,
                             description: "Node.js logo",
                             retired?: true)

    visit sticker_path(sticker.id)
    assert page.has_content?("No longer available")
  end

  test "retired stickers cannot be added to cart" do
    sticker = Sticker.create(title: "Nodejs",
                             image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                             price: 6,
                             description: "Node.js logo",
                             retired?: true)

    visit sticker_path(sticker.id)

    refute page.has_content?("Add to Cart")
  end
end
