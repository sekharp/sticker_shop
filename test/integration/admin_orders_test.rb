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

  def admin_login
    visit login_path
    fill_in "Username", with: "emily"
    fill_in "Password", with: "emily"
    click_button "Login"
  end

  test "admin can view listing of all orders" do
    user_setup
    order_setup
    admin_login

    assert page.has_content?("Ordered")
    assert page.has_content?(@order.id)
    assert page.has_link?(@order.id)
    assert page.has_content?("Ordered(1)")
    assert page.has_content?("Completed(2)")
    assert page.has_content?("Cancelled(1)")
  end

  test "admin can filter orders by each status type" do
    skip
    user_setup
    order_setup
    admin_login


  end
end