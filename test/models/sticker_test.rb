require "test_helper"

class StickerTest < ActiveSupport::TestCase
  test "is valid with correct params" do
    sticker = Sticker.new(title: "Node.js",
                          image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                          price: 6)

    assert sticker.valid?
  end

  test "is invalid without title" do
    sticker = Sticker.new(image_url: "http://devstickers.com/assets/img/cat/nodejs.png",
                          price: 6)

    assert sticker.invalid?
  end

  test "is valid without image url" do
    sticker = Sticker.new(title: "Node.js",
                          price: 6)

    assert sticker.valid?
  end

  test "is invalid without price" do
    sticker = Sticker.new(title: "Node.js",
                          image_url: "http://devstickers.com/assets/img/cat/nodejs.png")

    assert sticker.invalid?
  end
end
