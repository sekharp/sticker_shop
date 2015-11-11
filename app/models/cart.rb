class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_sticker(sticker_id)
    contents[sticker_id.to_s] ||= 0
    contents[sticker_id.to_s] += 1
  end

  def total_quantity
    contents.values.sum
  end

  def total_price
    subtotals = stickers.map do |cart_sticker|
      cart_sticker.quantity * cart_sticker.sticker.price
    end
    subtotals.sum
  end

  def count_of(sticker_id)
    contents[sticker_id.to_s]
  end

  def stickers
    contents.map do |sticker_id, quantity|
      sticker = Sticker.find(sticker_id)
      CartSticker.new(sticker, quantity)
    end
  end
end
