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
end
