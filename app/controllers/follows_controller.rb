class FollowsController < ApplicationController
  def create
    current_user.follows << User.find(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    follow = Follow.find_by(following_id: current_user.id, followed_id: params[:user_id])
    follow.destroy
    redirect_back(fallback_location: root_path)
  end
end
