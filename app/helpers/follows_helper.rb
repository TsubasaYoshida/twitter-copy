module FollowsHelper
  def follow_button(user)
    if Follow.exists?(following_id: current_user&.id, followed_id: user.id)
      button_to 'フォロー中', unfollow_path(user), method: :delete
    else
      button_to 'フォローする', follow_path(user)
    end
  end
end
