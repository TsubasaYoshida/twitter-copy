require 'rails_helper'

RSpec.describe Follow, type: :model do
  before do
    create(:user_1)
    create(:user_2)
  end

  it "有効な状態が存在すること" do
    follow = Follow.new(following_id: 1, followed_id: 2)
    expect(follow.valid?).to be_truthy
  end

  it "自分自身はフォローできないこと" do
    follow = Follow.new(following_id: 1, followed_id: 1)
    expect(follow.valid?).to be_falsey
  end

  it "同じユーザーを2回以上フォローできないこと" do
    # (通常操作では再現できないため)このテストが必要かどうかは微妙だが、勉強としてやってみる
    Follow.create(following_id: 1, followed_id: 2)
    expect do
      Follow.create(following_id: 1, followed_id: 2)
    end.to raise_error(ActiveRecord::RecordNotUnique)
  end
end
