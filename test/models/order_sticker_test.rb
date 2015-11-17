require 'test_helper'

class OrderStickerTest < ActiveSupport::TestCase
  should belong_to(:sticker)
  should belong_to(:order)
end
