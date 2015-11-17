class UserAuthenticationTest < ActionDispatch::IntegrationTest
  test "visitor can see login link" do
    visit root_path

    within("#primary-navigation") do
      assert page.has_content?("Login")
    end
  end

  test "visitor can create account and sign in" do
    visit root_path

    click_link "Create Account"

    fill_in "Username", with: "Jon"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert_equal '/dashboard', current_path
    within("#nav-bar") do
      assert page.has_content?("Logged in as Jon")
    end
    within("#profile") do
      assert page.has_content?("Profile")
      assert page.has_content?("Jon")
    end
    within("#primary-navigation") do
      refute page.has_content?("Login")
      assert page.has_content?("Logout")
    end
  end

  test "user can login" do
    User.create(username: "Jon",
                password: "password")

    visit root_path

    click_link "Login"
    fill_in "Username", with: "Jon"
    fill_in "Password", with: "password"
    click_button "Login"

    assert_equal root_path, current_path
    within("#primary-navigation") do
      refute page.has_content?("Login")
      assert page.has_content?("Logout")
    end
  end

  test "logged in user sees cart contents" do
    User.create(username: "Jon",
                password: "password")

    Sticker.create(title: "Node_js",
                   image: "http://devstickers.com/assets/img/cat/nodejs.png",
                   price: 6,
                   description: "Node.js logo")

    visit root_path
    click_button "Add to Cart"

    click_link "Login"
    fill_in "Username", with: "Jon"
    fill_in "Password", with: "password"
    click_button "Login"

    click_link "Cart"

    within("#cart-contents") do
      assert page.has_content?("Node_js")
      assert page.has_content?(6)
    end

    click_link "Logout"

    within("#primary-navigation") do
      assert page.has_content?("Login")
      refute page.has_content?("Logout")
    end
  end
end
