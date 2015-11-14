class OrdersController < ApplicationController
  def index
    current_user ? @orders = current_user.orders : @orders = {}
  end

  def new
    if session[:user_id].nil?
      redirect_to '/login'
    end
  end

  def show
    @order = Order.find(params[:id].to_i)
  end
end
