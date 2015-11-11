class SessionController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Invalid username or password. Try again."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:logout] = "Goodbye!"
    redirect_to login_path
  end
end
