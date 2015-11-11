class CartSticker # look into SimpleDelegator
  attr_reader :sticker,
              :quantity

  def initialize(sticker, quantity)
    @sticker = sticker
    @quantity = quantity
  end

  def subtotal
    sticker.price * quantity
  end
end
