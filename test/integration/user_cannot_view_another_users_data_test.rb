# As an Authenticated User
#       I cannot view another user's private data (current or past orders, etc)
#       I cannot view the administrator screens or use admin functionality
#       I cannot make myself an admin

class AuthenticatedUserPrivacyTest < ActionDispatch::IntegrationTest
  test "authenticated user cannot see another user's data" do
    User.create(username: "emily",
                password: "password")

    visit root_path
    click_link "Login"
    fill_in "Username", with: "emily"
    fill_in "Password", with: "password"
    click_button "Login"

    visit '/users'
    assert page.has_content?("Oops!")

    visit '/user/1'
    assert page.has_content?("Oops!")

    visit '/admin/dashboard'
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

end
