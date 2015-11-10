require 'test_helper'

class StickerTest < ActiveSupport::TestCase
  test "sticker is valid" do
    sticker = Sticker.new(title: "Node.js",
                          image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                          price: 6)

    assert sticker.valid?
  end
end
