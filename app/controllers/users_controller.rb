class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
  end

  def follow_user
    @follow = current_user.follow(User.find(params[:id]))
    if @follow
      redirect_to user_path(params[:id])
    end
  end

  def unfollow_user
    @unfollow = current_user.unfollow(User.find(params[:id]))
    if @unfollow
      redirect_to user_path(params[:id])
    end
  end
end
