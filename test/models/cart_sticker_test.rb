require 'test_helper'

class CartStickerTest < ActiveSupport::TestCase
  test "can initialize with sticker and quantity" do
    sticker = Sticker.new(title: "Node.js",
                          image: "http://devstickers.com/assets/img/cat/nodejs.png",
                          price: 6)
    c_sticker = CartSticker.new(sticker, 4)

    assert_equal 4, c_sticker.quantity
    assert_equal sticker, c_sticker.sticker
  end

  test "can return subtotal" do
    sticker = Sticker.new(title: "Node.js",
                          image: "http://devstickers.com/assets/img/cat/nodejs.png",
                          price: 6)
    c_sticker = CartSticker.new(sticker, 4)

    assert_equal 24, c_sticker.subtotal
  end
end
