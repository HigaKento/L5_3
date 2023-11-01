class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def new
    @user=User.new
  end
  
  def create
    p=BCrypt::Password.create(params[:user][:pass])
    user=User.new(uid: params[:user][:uid],pass: p)
    user.save
    redirect_to users_path
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
end
