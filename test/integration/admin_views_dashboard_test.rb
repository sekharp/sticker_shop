require 'test_helper'

class AdminViewsDashboardTest < ActionDispatch::IntegrationTest
  test "admin can view the admin dashboard" do
    admin = User.create(username: "Jason",
                        password: "password",
                        role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_dashboard_index_path
    assert page.has_content?("Admin Dashboard")
  end

  test "registered user sees 404 at admin dashboard" do
    user = User.create(username: "James",
                       password: "password",
                       role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_dashboard_index_path
    refute page.has_content?("Admin Dashboard")
    assert page.has_content?("404")
  end

  test "un-regestered user sees a 404 at admin dashboard" do
    visit admin_dashboard_index_path
    refute page.has_content?("Admin Dashboard")
    assert page.has_content?("404")
  end
end
