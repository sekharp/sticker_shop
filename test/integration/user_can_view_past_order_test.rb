class UserCanViewPastOrderTest < ActionDispatch::IntegrationTest
  test "past order view" do
    user = User.create(username: "Sekhar",
                       password: "password")

    sticker = Sticker.create(title: "Nodejs",
                             image: "http://devstickers.com/assets/img/cat/nodejs.png",
                             price: 6,
                             description: "Node.js logo")

    order = user.orders.create(status: "Ordered")
    
    order_sticker = OrderSticker.create(order_id: order.id,
                                        sticker_id: sticker.id,
                                        quantity: 1)

    visit login_path

    fill_in "Username", with: "Sekhar"
    fill_in "Password", with: "password"
    click_button "Login"

    visit "/orders"
    click_link "#{order.id}"

    within("#order-details") do
      assert page.has_content?("Sticker: Nodejs")
      assert page.has_content?("Quantity: 1")
      assert page.has_content?("Sticker Price: $6")
      assert page.has_content?("Sticker Subtotal: $6")

      assert page.has_content?("Status: Ordered")
      assert page.has_content?("Total Price: $6")
      assert page.has_content?("Order Created At: #{order.created_at.strftime("%B %d, %Y at %H:%M:%S")}")
      assert page.has_content?("Status of Order Completion or Cancellation: Order Not Finished")
      assert page.has_content?("Timestamp of Completion or Cancellation: N/A")
    end
  end
end
