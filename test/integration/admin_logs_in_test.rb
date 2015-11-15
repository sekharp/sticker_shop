require 'test_helper'

class AdminLogsInTest < ActionDispatch::IntegrationTest
  test "admin logs in and redirects to admin dashboard" do
    User.create(username: "Jason",
                password: "password",
                role: 1)
    visit login_path

    fill_in "Username", with: "Jason"
    fill_in "Password", with: "password"
    click_button "Login"

    assert_equal admin_dashboard_index_path, current_path
    assert page.has_content?("Admin Dashboard")
  end
end
