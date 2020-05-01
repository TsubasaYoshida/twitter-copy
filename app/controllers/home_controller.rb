class HomeController < ApplicationController
  def index
    @tweets = Tweet.timeline_tweets(current_user)
  end

  def sign_up_done
    # TODO 一回きりのアクセスにしたい(usersテーブルのなにかの値で行けそう)
  end
end
