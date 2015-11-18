require "test_helper"

class CartTest < ActiveSupport::TestCase
  test "stores stickers" do
    cart = Cart.new( { "1" => 1 } )

    assert_equal({ "1" => 1 }, cart.contents)
  end

  test "can add sticker" do
    cart = Cart.new( { "1" => 1 } )

    cart.add_sticker(1)

    assert_equal({ "1" => 2 }, cart.contents)
  end

  test "can subtract sticker" do
    cart = Cart.new( { "1" => 2 } )

    cart.subtract_sticker(1)

    assert_equal( { "1" => 1 } , cart.contents)
  end

  test "returns sum of all added stickers" do
    cart = Cart.new({ "1" => 1, "2" => 7, "3" => 4})

    assert_equal 12, cart.total_quantity
  end

  test "return sum of specific added stickers" do
    cart = Cart.new({ "1" => 1, "2" => 7, "3" => 4})

    assert_equal 7, cart.count_of(2)
  end
end
