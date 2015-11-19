class OrdersController < ApplicationController
  before_action :require_login

  def index
    @orders = current_user.orders
  end

  def create
    if session[:cart].nil? || session[:cart].empty?
      redirect_to '/cart'
      flash[:notice] = "No stickers in cart. Don't you want stickers?"
    else
      order = Order.create(status: "ordered", user_id: current_user.id)
      session[:cart].map { |id, q| OrderSticker.create(quantity: q, sticker_id: id, order_id: order.id) }
      session[:cart] = {}
      flash[:success] = "Order was successfully placed."
      redirect_to orders_path
    end
  end

  def show
    order = Order.find(params[:id].to_i)
    if current_user.id == order.user.id
      @order = order
    else
      redirect_to orders_path
    end
  end

  private

  def require_login
    unless current_user
      redirect_to login_path
    end
  end
end
