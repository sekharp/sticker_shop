class OrdersController < ApplicationController
  def index
    current_user ? @orders = current_user.orders : @orders = {}
  end

  def new
    if session[:user_id].nil?
      redirect_to '/login'
    else
      order = Order.create(status: "Ordered", user_id: current_user.id)
      session[:cart].map { |id, q| OrderSticker.create(quantity: q, sticker_id: id, order_id: order.id) }
      session[:cart] = {}
      flash[:success] = "Order was successfully placed."
      redirect_to orders_path
    end
  end

  def show
    @order = Order.find(params[:id].to_i)
  end
end
