class CartStickersController < ApplicationController
  def create
    sticker = Sticker.find(params[:sticker_id])
    @cart.add_sticker(sticker.id)
    session[:cart] = @cart.contents
    flash[:notice] = "Sticker added to cart"
    redirect_to root_path
  end

  def destroy
    sticker = Sticker.find(params[:id])
    @cart.subtract_sticker(sticker.id)
    session[:cart] = @cart.contents
    flash[:notice] = "Sticker removed from cart"
    redirect_to cart_index_path
  end
end
