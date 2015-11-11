class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # User.find_by(username: params[:username])
      flash[:notice] = "Logged in as #{@user.username}"
      redirect_to dashboard_path
    else
      flash.now[:error] = "Something went wrong. Please try again."
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :username,
                                 :password)
  end

end
