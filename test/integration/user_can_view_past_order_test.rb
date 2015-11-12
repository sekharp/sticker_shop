class UserCanViewPastOrderTest < ActionDispatch::IntegrationTest
  test "past order view" do
    user = User.create(username: "Sekhar",
                       password: "password")

    fill_in "Username", with: "Sekhar"
    fill_in "Password", with: "password"
    click_button "Login"

    sticker = Sticker.create(title: "Nodejs",
                             image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                             price: 6,
                             description: "Node.js logo")

    visit root_path
    click_button "Add to Cart"
    click_link "Cart"
    click_link "Order"
    visit "/orders"

    within("#order-history") do
      assert page.has_content?("Past Orders")
      assert page.has_content?("Nodejs")
      assert page.has_link?(sticker_path(sticker.id))
      assert page.has_content?("Quantity: 1")
      assert page.has_content?("Total Price: $6")
      assert page.has_content?("Sticker Subtotal: $6")
      assert page.has_content?("ordered")
      assert page.has_content?("2015") # figure out how date comres across, should be the date the order was submitted
      assert page.has_content?("Order Status") # needs to be completed or cancelled + when the order was completed or cancelled
    end
  end
end
