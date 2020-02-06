class UsersController < ApplicationController

  def new
    @user = User.new()
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash.notice = "User '#{@user.username}' updated!"
      redirect_to new_user_path
    else
      flash.notice = "User not updated.  Fix errors first."
      render :edit
    end
  end

  def create
    #@user = User.new(username: params[:username],email: params[:email], password: params[:password])
    @user = User.new(user_params)
    if @user.save
      flash.notice = "User '#{@user.username}' created!"
      redirect_to new_user_path
    else
      flash.notice = "User not created. Fix errors first."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
end
