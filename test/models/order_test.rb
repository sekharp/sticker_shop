require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:order_stickers)

  test "is finished if status includes completed or cancelled" do
    user = User.create( username: "jason",
                        password: "password")
    order = user.orders.create( status: "completed",
                                user_id: user.id )
    assert order.finished?

    user_2 = User.create( username: "bob",
                          password: "password")
    order_2 = user.orders.create( status: "Cancelled",
                                  user_id: user.id )
    assert order.finished?
  end

  test "is no finished if status includes paid or ordered" do
    user = User.create( username: "jason",
                        password: "password")
    order = user.orders.create( status: "Paid",
                                user_id: user.id )
    refute order.finished?

    user_2 = User.create( username: "bob",
                          password: "password")
    order_2 = user.orders.create( status: "Ordered",
                                  user_id: user.id )
    refute order.finished?
  end
end
