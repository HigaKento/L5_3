class TweetsController < ApplicationController
  def index
    @tweets=Tweet.all
    @tweet=Tweet.new
  end

  
  def create
    tweet=Tweet.new(message: params[:tweet][:message])
    tweet.user_id=current_user.id
    tweet.save
    redirect_to root_path
  end
  
  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to root_path
  end
end
