class FollowsController < ApplicationController
  before_action :set_user

  def create
    current_user.follows << @user
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.follows.destroy(@user)
    redirect_back(fallback_location: root_path)
  end
end
