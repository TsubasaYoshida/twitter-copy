module FollowsHelper
  def follow_button(user)
    return if current_user == user
    if Follow.exists?(following_id: current_user&.id, followed_id: user.id)
      button_to 'フォロー中', unfollow_path(user), method: :delete, class: 'follow-button'
    else
      button_to 'フォローする', follow_path(user), class: 'follow-button'
    end
  end
end
