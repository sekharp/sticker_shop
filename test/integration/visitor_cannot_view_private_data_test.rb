class AuthenticatedUserPrivacyTest < ActionDispatch::IntegrationTest
  test "visitor cannot see user data" do
    visit '/users'
    assert page.has_content?("Oops!")

    visit '/user/1'
    assert page.has_content?("Oops!")

    visit '/admin/dashboard'
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

  test "visitor cannot see admin data" do
    visit '/admin/dashboard'
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

  test "visitor is redirected to login before checkout" do
    Sticker.create(title: "Nodejs",
                   image: "http://devstickers.com/assets/img/cat/nodejs.png",
                   price: 6,
                   description: "Node.js logo")

    visit root_path
    click_button "Add to Cart"
    click_link "Cart"
    click_button "Checkout"

    assert '/login', current_path
    assert page.has_content?("Username")
  end
end
