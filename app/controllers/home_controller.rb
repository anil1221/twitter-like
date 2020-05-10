class HomeController < ApplicationController
  def index
    @tweets = Tweet.includes(:user).where(user_id: current_user.following.pluck(:id))
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      flash[:error] = @tweet.errors.full_messages
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
