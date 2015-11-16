# As an Admin
#       When I visit the dashboard
#       Then I can see a listing of all orders
#       And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")
#       And I can see a link for each individual order
#       And I can filter orders to display by each status type  ("Ordered", "Paid", "Cancelled", "Completed")
#       And I have links to transition the status
#         - I can click on "cancel" on individual orders which are "paid" or "ordered"
#         - I can click on "mark as paid" on orders that are "ordered"
#         - I can click on "mark as completed" on orders that are "paid"

require 'test_helper'

class AdminOrdersTest < ActionDispatch::IntegrationTest

  def user_setup
    @emily = User.create(username: "emily",
                       password: "emily",
                       role: 1)
    @sekhar = User.create(username: "sekhar",
                         password: "sekhar")
  end

  def order_setup
    @order = @sekhar.orders.create(status: "ordered")
    @sekhar.orders.create(status: "completed")
    @emily.orders.create(status: "completed")
    @emily.orders.create(status: "cancelled")
  end

  test "admin can view listing of all orders" do
    user_setup
    order_setup

    visit login_path
    fill_in "Username", with: "emily"
    fill_in "Password", with: "emily"
    click_button "Login"

    assert page.has_content?("ordered")
    assert page.has_content?(@order.id)
    assert page.has_link?(@order.id)
    assert page.has_content?("Ordered(1)")
    assert page.has_content?("Completed(2)")
    assert page.has_content?("Cancelled(1)")
  end
end
