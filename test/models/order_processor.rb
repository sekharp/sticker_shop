class OrderProcessor
  def initialize(cart, current_user)
    @cart = cart
    @current_user = current_user
  end

  if processor.complete
    (insert functionality from controller before)
  else
    flash[:notice] = "Order Error"
  end
end
