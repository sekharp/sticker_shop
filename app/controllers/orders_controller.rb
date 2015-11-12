class OrdersController < ApplicationController
  def index
    current_user ? @orders = current_user.orders : @orders = {}
  end

  def show
    @order = Order.find(params[:id].to_i)
  end
end
