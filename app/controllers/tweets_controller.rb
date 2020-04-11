class TweetsController < ApplicationController
  before_action :set_tweet, only: :destroy

  def index
    @tweets = Tweet.all
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      head :created
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet.destroy
    head :no_content
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:user_id, :body)
  end
end
