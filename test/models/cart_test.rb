require "test_helper"

class CartTest < ActiveSupport::TestCase
  test "stores stickers" do
    cart = Cart.new( { "1" => 1 } )

    assert_equal({ "1" => 1 }, cart.contents)
  end

  test "can add stickers" do
    cart = cart.new( { "1" => 1 } )

    cart.add_stickers(1)

    assert_equal({ "1" => 2 }, cart.contents)
  end

  test "returns sum of all captured stickers" do
    cart = cart.new({ "1" => 1, "2" => 7, "3" => 4})

    assert_equal 12, cart.total
  end

  test "return sum of specific captured stickers" do
    cart = cart.new({ "1" => 1, "2" => 7, "3" => 4})

    assert_equal 7, cart.count_of(2)
  end
end
