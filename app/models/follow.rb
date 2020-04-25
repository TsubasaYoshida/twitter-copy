class Follow < ApplicationRecord
  belongs_to :following, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validate :cannot_follow_self

  private

  def cannot_follow_self
    errors.add(:base, '') if following_id == followed_id
  end
end
