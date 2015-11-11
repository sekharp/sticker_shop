class CartController < ApplicationController
  def index
    @quantities = session[:cart]
    @stickers = Sticker.cart_items(session[:cart])
    @cart = Cart.new(session[:cart])
    @total_price = Sticker.cart_items(session[:cart]).map { |sticker| sticker.price * @quantities[sticker.id.to_s] }.sum
  end
end
