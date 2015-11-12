class CartController < ApplicationController
  def index
  end

  def create
    sticker = Sticker.find(params[:sticker_id])
    @cart.add_sticker(sticker.id)
    session[:cart] = @cart.contents
    flash[:notice] = "Sticker added to cart"
    redirect_to cart_index_path
  end

  def destroy
    sticker = Sticker.find(params[:id])
    @cart.remove_sticker(sticker.id)
    session[:cart] = @cart.contents
    flash[:success] = "Successfully removed #{view_context.link_to "#{sticker.title}", sticker_path(sticker.id)} sticker from your cart.".html_safe
    redirect_to cart_index_path
  end

end
