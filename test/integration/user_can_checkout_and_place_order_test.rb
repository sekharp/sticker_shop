class UserCanCheckoutAndPlaceOrderTest < ActionDispatch::IntegrationTest
  def setup
    Sticker.create(title: "Nodejs",
                   image: "http://devstickers.com/assets/img/cat/nodejs.png",
                   price: 6)
  end

  test "visitor will be asked to login when trying to checkout" do
    visit root_path
    click_button "Add to Cart"

    click_link "Cart"

    assert page.has_content?("Nodejs")
    assert page.has_content?("Quantity: 1")

    click_button "Checkout"

    assert page.has_content?("Login")
    assert page.has_content?("Username")
    assert page.has_content?("Password")
  end

  test "user can checkout and place order" do
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

    assert page.has_content?("Nodejs")
    assert page.has_content?("Quantity: 2")

    click_button "Checkout"

    assert page.has_content?("Past Orders")

    within("#past-orders") do
      assert page.has_content?("Ordered")
    end
  end
end
