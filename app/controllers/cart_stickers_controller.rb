class CartStickersController < ApplicationController
  def create
    sticker = Sticker.find(params[:sticker_id])
    @cart.add_sticker(sticker.id)
    session[:cart] = @cart.contents
    flash[:notice] = "Sticker added to cart"
    redirect_to root_path
  end
end
