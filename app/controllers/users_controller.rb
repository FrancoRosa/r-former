class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end
  

  def new
    @user = User.new
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
