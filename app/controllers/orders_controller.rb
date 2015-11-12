class OrdersController < ApplicationController
  def index
    current_user ? @orders = current_user.orders : @orders = {}
  end
end
