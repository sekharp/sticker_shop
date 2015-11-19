require 'test_helper'

class UserCannotViewOtherUsersOrdersTest < ActionDispatch::IntegrationTest
  test "user can only see his or her past orders" do
    sekhar = User.create(username: "Sekhar",
                         password: "password")

    emily = User.create(username: "Emily",
                        password: "password")

    sekhar_order = sekhar.orders.create(status: "ordered")
    emily_order = emily.orders.create(status: "completed")

    visit root_path
    click_link "Login"

    fill_in "Username", with: "Sekhar"
    fill_in "Password", with: "password"
    click_button "Login"

    visit orders_path

    assert page.has_content?("Past Orders")
    assert page.has_content?("ordered")

    visit order_path(sekhar_order.id)

    assert page.has_content?("Order Details")

    visit order_path(emily_order.id)

    assert orders_path, current_path
    assert page.has_content?("Past Orders")
  end
end
