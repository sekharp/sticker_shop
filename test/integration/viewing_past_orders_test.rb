require 'test_helper'

class ViewingPastOrdersTest < ActionDispatch::IntegrationTest
  test "authenticated user can see past orders" do
    user = User.create(username: "Sekhar",
                       password: "password")

    visit root_path
    click_link "Login"

    fill_in "Username", with: "Sekhar"
    fill_in "Password", with: "password"
    click_button "Login"

    user.orders.create(status: "ordered")

    visit orders_path

    assert page.has_content?("Past Orders")

    within("#past-orders") do
      assert page.has_content?("ordered")
    end
  end
end
