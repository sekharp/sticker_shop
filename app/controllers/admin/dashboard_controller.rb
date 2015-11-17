class Admin::DashboardController < Admin::BaseController
  def index
    @orders = Order.all
  end

  def show
    @orders = Order.where(status: params[:status].downcase)
    unless @orders
      redirect_to admin_dashboard_index_path
    end
  end

end
