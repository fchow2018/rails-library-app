class UsersController < ApplicationController
  # before_action :require_login, only: [:show]
  # before_action :logged_in?, only: [:show]

  # the above code doesn't work

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params) # calls user_params method
    login(@user)
    flash[:notice] = "User created"
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
    render :show
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
