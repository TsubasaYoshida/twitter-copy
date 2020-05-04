require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = build(:tweet)
  end

  it "bodyがあれば有効な状態であること" do
    expect(@tweet.valid?).to be_truthy
  end

  it "bodyがなければ無効な状態であること" do
    @tweet.body = ''
    expect(@tweet.valid?).to be_falsey
  end

  it "フォローしている人と自分自身が投稿したツイートを取得できること" do
    tweet_1 = create(:tweet_1)
    tweet_2 = create(:tweet_2)
    Follow.create(following_id: 1, followed_id: 2)
    expect(Tweet.timeline_tweets(tweet_1.user)).to eq [tweet_2, tweet_1]
  end
end
