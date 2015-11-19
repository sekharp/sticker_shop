class AdminCannotModifyOtherUsersDataTest < ActionDispatch::IntegrationTest
  def setup
    @admin = User.create(username: "Jason",
                         password: "password",
                         role: 1)
    visit login_path
    fill_in "Username", with: "Jason"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  test "admin can modify their account data" do
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
    admin_id = @admin.id

    visit '/users'
    assert page.has_content?("Oops!")

    visit '/users/1'
    assert page.has_content?("Oops!")
  end
end
