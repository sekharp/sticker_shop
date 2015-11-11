class CartController < ApplicationController
  def index
    @stickers = Sticker.cart_items(session[:cart])
  end
end
