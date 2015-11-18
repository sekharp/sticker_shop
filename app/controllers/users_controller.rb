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
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)

    flash.notice = "Profile Updated!"
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :username,
                                 :password)
  end
end
