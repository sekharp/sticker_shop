# As a logged in Admin
#       I can modify my account data
#       But I cannot modify any other user's account data

class AdminCannotModifyOtherUsersDataTest < ActionDispatch::IntegrationTest
  test "admin can modify their account data" do
    admin = User.create(username: "Jason",
                        password: "password",
                        role: 1)
    visit login_path
    fill_in "Username", with: "Jason"
    fill_in "Password", with: "password"
    click_button "Login"

    visit dashboard_path
    click_button "Edit Profile"
    fill_in "user_username", with: "Updatedjason"
    fill_in "user_password", with: "updatedpassword"
    fill_in "user_first_name", with: "updatedfirstname"
    fill_in "user_last_name", with: "updatedlastname"

    click_button "Update Profile"

    assert_equal dashboard_path, current_path
    assert page.has_content?("Updatedjason")
    assert page.has_content?("updatedlastname")
    assert page.has_content?("updatedfirstname")
  end

  test "admin cannot modify other users account data" do
    skip
  end
end
