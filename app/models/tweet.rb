class Tweet < ApplicationRecord
  belongs_to :user

  validates :body,
            presence: true,
            length: {maximum: 140}

  def self.timeline_tweets(current_user)
    timeline_users = current_user.follows.to_a
    timeline_users << current_user
    where(user_id: timeline_users).order(created_at: :desc)
  end
end
