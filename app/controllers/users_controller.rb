class UsersController < ApplicationController


  def index
    @users = User.all
  end


  def edit
    @user = User.find params[:id]
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
