class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def new
    @user=User.new
  end
  
  def create
    if User.exists?(uid: params[:user][:uid])
      redirect_to new_user_path
    else
      user=User.new(uid: params[:user][:uid],password: params[:user][:password],password_confirmation: params[:user][:password_confirmation])
      user.save
      redirect_to users_path
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
end
