class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      if @user.admin? && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to admin_dashboard_index_path
      elsif @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash.now[:error] = "Invalid username or password. Try again."
        render :new
      end
    else
      flash[:errors] = "Please create account first"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:logout] = "Goodbye!"
    redirect_to login_path
  end
end
