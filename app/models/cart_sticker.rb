class CartSticker < SimpleDelegator
  attr_reader :sticker,
              :quantity

  def initialize(sticker, quantity)
    @sticker = sticker
    @quantity = quantity
    super(@sticker)
  end

  def subtotal
    sticker.price * quantity
  end
end
